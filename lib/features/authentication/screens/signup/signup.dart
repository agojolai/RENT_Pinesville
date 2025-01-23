import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled/features/authentication/controllers/signup/signup_controller.dart';
import 'package:untitled/utils/validators/validations.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 60),
            Text(
              "Let's Create your Account!",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(height: 16),
            Form(
              key: controller.signupFormKey,
              child: Column(children: [
                Row(children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          PValidator.validateEmptyText("First Name", value),
                      expands: false,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: 'First Name'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          PValidator.validateEmptyText("Last Name", value),
                      expands: false,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: 'Last Name'),
                    ),
                  )
                ]),
                SizedBox(height: 16),

                //emaail
                TextFormField(
                  validator: (value) => PValidator.validateEmail(value),
                  controller: controller.email,
                  expands: false,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: 'Email'),
                ),

                SizedBox(height: 16),

                //phone
                TextFormField(
                  validator: (value) => PValidator.validatePhoneNumber(value),
                  controller: controller.phoneNo,
                  expands: false,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.call),
                      labelText: 'Phone Number'),
                ),
                SizedBox(height: 16),

                //password
                Obx(
                      ()=> TextFormField(
                    validator: (value) => PValidator.validatePassword(value),
                    controller: controller.password,
                    obscureText: controller.hidePassword.value,
                    expands: false,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                        labelText: 'Password'),
                  ),
                ),

                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //unit no.
                    Expanded(
                        child: TextFormField(
                      validator: (value) =>
                          PValidator.validateEmptyText("Unit No.", value),
                      controller: controller.unitNo,
                      decoration: InputDecoration(
                        labelText: 'Unit No.',
                        prefixIcon: Icon(Icons.meeting_room_rounded),
                      ),
                    )),
                    SizedBox(width: 16),

                    //move in date
                    Expanded(
                    child: GestureDetector(
                    onTap: () {
                    controller.selectMoveInDate(context); // Call the controller method
                    },
                    child: AbsorbPointer(
                    child: TextFormField(
                    controller: controller.moveInDate,
                    validator: (value) => PValidator.validateDate(value),
                    decoration: InputDecoration(
                    labelText: 'Move-in Date',
                    prefixIcon: Icon(Icons.calendar_month),
                    ),
                    readOnly: true,
                    ),
                    ),
                    ),
                    ),

                  ],
                ),
                //space

                SizedBox(height: 16),

                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      //create account function and snackbar na account created
                      onPressed: () {
                        print("Create Account button pressed"); // Debug point
                        controller.signup();
                      },
                      child: Text("Create Account",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ))
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
