import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled/features/authentication/controllers/login/login_controller.dart';
import 'package:untitled/features/authentication/screens/signup/signup.dart';
import 'package:untitled/utils/validators/validations.dart';
import '../forget_password/forgot_password.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        body: Form(
          key: controller.loginFormKey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
              child: Center(
            child: Column(children: [
              //space
              SizedBox(height: 200),
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

              TextFormField(
                validator: (value) => PValidator.validateEmail(value),
                controller: controller.email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right), labelText: 'Email'),
              ),
              SizedBox(height: 20),

              //PASSWORD BUTTON
              Obx(() => TextFormField(
                    validator: (value) => PValidator.validateEmptyText('Password', value),
                    controller: controller.password,
                    obscureText: controller.hidePassword.value,
                    expands: false,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                        labelText: 'Password'),
                  )),

              SizedBox(height: 20),

              //LOG IN BUTTON
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: Text("Log In",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  )),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //CREATE ACCOUNT
                  TextButton(
                    onPressed: () => Get.to(() => SignUpScreen()),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Color(0xFF006989),
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                    ),
                  ),

                  //FORGOT PASSWORD
                  TextButton(
                    onPressed: () => Get.to(() => ForgetPassword()),
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Color(0xFF006989),
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          )),
        ),
      ),
    ));
  }
}
