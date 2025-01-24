import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/validators/validations.dart';
import '../../controllers/forget_password/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: controller.forgetPasswordFormKey,
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
                  controller: controller.email,
                validator: (value) => PValidator.validateEmail(value),
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
                  onPressed: () => controller.forgetPassword(),
                  child: Text("Log In",
                      style: TextStyle(color: Colors.white,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}