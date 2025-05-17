import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled/data/repository/auth_repository/auth_repo.dart';
import 'package:untitled/features/authentication/models/user_model.dart';
import 'package:untitled/utils/constants/PImages.dart';
import 'package:untitled/utils/popups/full_screen_loader.dart';
import 'package:untitled/utils/popups/loaders.dart';
import '../../../../data/repository/user_repository/user_repository.dart';
import '../../../../utils/helpers/network_manager.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNo = TextEditingController();
  final unitNo = TextEditingController();
  final moveInDate = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // MOVE IN DATE PICKER

  // Method to handle the datepicker logic
  Future<void> selectMoveInDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
      moveInDate.text = formattedDate; // Update the controller's text field
    }
  }

  //SIGN UP
    void signup() async {
     // PFullScreenLoader.openLoadingDialog('Processing...', PImages.processData);
    try {
      // Open loading dialog
      PFullScreenLoader.openLoadingDialog('Processing...', PImages.processData);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        PLoaders.errorSnackBar(
            title: 'Error', message: 'Please check your internet connection');
        return;
      }

        // **Form Validation**
        if (!signupFormKey.currentState!.validate()) {
          PFullScreenLoader.stopLoading();
          return;
        } // Stop execution if validation fails

      print("validated");
      // register user in firebasse auth & save user data
     final userCredentials = await AuthRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      print("authrepopassed");
     //save authenticated user data in firestore
      final newUser = UserModel(
        id: userCredentials.user!.uid,  // gives UID upon registering
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phoneNo: phoneNo.text.trim(),
          unitNo: unitNo.text.trim(),
          moveInDate: moveInDate.text.trim(),
          profilePic: ''
      );
      print("userpassed");
/*
      // save user data in firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);*/

      final userRepository = Get.put(UserRepository());
      await userRepository.savePendingUser(newUser);
      print("user saved");

      PFullScreenLoader.stopLoading();

      //go back to log in screen
      AuthRepository.instance.logout();

      print("back");

      print("tanigna");

      // Show info message
      PLoaders.successSnackBar(
        title: 'Application Received',
        message:
        'Please wait for an email confirmation before logging in.',);
        //'You can now log in.',);

      print("application received");

    } catch (e) {
      PLoaders.errorSnackBar(title: 'Error', message: e.toString());
      PFullScreenLoader.stopLoading();
    }
  }
}
