import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});

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
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Heading
            const Text('Forget Password',
            style: TextStyle(
             // color: Color(0xFF006989),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),),

            const SizedBox(height: 8),

            const Text('Please enter your email to reset your password.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),),

            const SizedBox(height: 25),
            ///Text Field
            TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Iconsax.direct_right),
                  ),

            ),

            const SizedBox(height: 25),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => resetPassword(context),
                child: Text("Log In",
                    style: TextStyle(color: Colors.white,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}