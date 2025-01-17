import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/buttons.dart';
import 'package:untitled/components/textFields.dart';
import 'package:untitled/features/password_configuration/forgot_password.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  //log in method
  void logUserIn() async {
    //show loading circle pagka-log in
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //log in //TODO: ISEMPTY OR NULL EXCEPTION
    try {

      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        throw Exception('empty-fields');
      }

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);

      //pop the loading after logging in
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // Firebase specific error handling
      if (e.code == 'user-not-found') {
        showErrorMessage("No user found with that email.");
      } else if (e.code == 'wrong-password') {
        showErrorMessage("Incorrect password. Please try again.");
      } else if (e.code == 'invalid-email') {
        showErrorMessage("The email address is not valid.");
      } else if (e.code == 'user-disabled') {
        showErrorMessage("This user account has been disabled.");
      } else if (e.code == 'too-many-requests') {
        showErrorMessage("Too many attempts. Please try again later.");
      } else {
        showErrorMessage("An unexpected error occurred. Please try again.");
      }
    } catch (e) {
      // Handle non-Firebase exceptions like empty fields
      Navigator.pop(context);
      if (e.toString() == 'Exception: empty-fields') {
        showErrorMessage("Email and password cannot be empty.");
      } else {
        showErrorMessage("An unexpected error occurred. Please try again.");
      }
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Login Error",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Color(0xFF006989),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //create acc method
  void CreateAcc() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        // to make the page scrollable when keyboard appears
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200), //some space
              // welcome text
              const Text("Welcome!",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  )),

              // subwelcome text
              const Text("Enter your credentials to log in",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  )),

              const SizedBox(height: 35),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
              ),

              const SizedBox(height: 20),

              // password textfield
              PasswordTextField(
                controller: passwordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 20),

              //log in
              LoginButton(
                onTap: logUserIn,
              ),

              const SizedBox(height: 35),

              new GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/features/password_configuration');
                },
                child: const Text('Forget Password?',
                style: TextStyle(
                  color: Color(0xFF006989),
                  fontFamily: 'Poppins',
                  fontSize: 12,
                ),),
              ),


              const SizedBox(height: 35),

              //don't have an account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Color(0xFF006989),
                      fontFamily: 'Poppins',
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(width: 15),

                  //create button
                  newAccButton(
                    onTap: CreateAcc,
                  ),

                  //button
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

