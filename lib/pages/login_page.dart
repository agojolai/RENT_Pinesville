import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/buttons.dart';
import 'package:untitled/components/textFields.dart';

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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      //pop the loading after logging in
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        showErrorMessage();
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        showErrorMessage();
      }
    }
  }

  void showErrorMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
              title: Center(
                  child: Text(
            "Invalid Email or Password",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          )));
        });
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
                obscureText: true,
              ),
              const SizedBox(height: 20),

              //log in
              LoginButton(
                onTap: logUserIn,
              ),

              const SizedBox(height: 35),

              // forgot password
              const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xFF006989),
                  fontFamily: 'Poppins',
                  fontSize: 12,
                ),
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
