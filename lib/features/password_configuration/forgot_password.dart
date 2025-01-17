import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class forgetPassword extends StatelessWidget {
   forgetPassword({super.key});

  // Controller for the email input
  final TextEditingController emailController = TextEditingController();

  // Method to handle password reset
  void resetPassword(BuildContext context) async {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      // Show an error if the email field is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter your email address.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Show a success message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Password reset email sent. Please check your inbox.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth errors
      String message = 'An error occurred.';
      if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found with this email address.';
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFFFF),
        ),),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Heading
            const Text('Forget Password',
            style: TextStyle(
              color: Color(0xFF006989),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),),

            const SizedBox(height: 8),

            const Text('Please enter your email to reset your password',
            style: TextStyle(
              color: Color(0xFF000000),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              fontSize: 10,
            ),),

            const SizedBox(height: 25),
            ///Text Field
            TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(
                    color: Color(0xFF939393),
                    fontFamily: 'Poppins',
                    fontSize: 12
                  ),
                  prefixIcon: const Align(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: Icon(Icons.email),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 1, color: Colors.grey)
                  )
                )
            ),

            const SizedBox(height: 25),

            // Submit Button
            SizedBox(
              height: 40.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => resetPassword(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006989),
                  side: const BorderSide(color: Color(0xFF006989)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}