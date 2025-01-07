import 'package:flutter/material.dart';
import 'package:untitled/components/buttons.dart';
import 'package:untitled/components/textFields.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void logUserIn(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 200), //some space
            // welcome text
                const Text("Welcome!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                )
                ),

            // subwelcome text
              const Text("Enter your credentials to log in",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                )
                ),

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

                  const SizedBox(width:15),

                              //create button
                  newAccButton(),
                ],
              ),

          ],),
        ),
      )
    );
  }
}