import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../data/repository/auth_repository/auth_repo.dart';
import '../../../../utils/constants/PImages.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/navigation_menu.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  //variable
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    email.text = localStorage.read('email') ;
    password.text = localStorage.read('password');
/*
    email.text = localStorage.read('email') ?? '';
    password.text = localStorage.read('password') ?? '';
    */
 super.onInit();
  }

  //LOG IN function

  void emailAndPasswordSignIn() async {
    try {
      // Open loading dialog
      print("back");

      print("tanigna");
      PFullScreenLoader.openLoadingDialog('Processing...', PImages.processData);
      print("abagna");
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        PLoaders.errorSnackBar(
            title: 'Error', message: 'Please check your internet connection');
        return;
      }
      print("network");


      // **Form Validation**
      if (!loginFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      } // Stop execution if validation fails
      print("local");

      final emailInput = email.text.trim();

      // 🔍 Step 1: Check if the email exists in the approved "Users" collection
      final snapshot = await AuthRepository.instance.firebaseStore
          .collection('Users')
          .where('Email', isEqualTo: emailInput)
          .get();

      if (snapshot.docs.isEmpty) {
        PFullScreenLoader.stopLoading();
        PLoaders.errorSnackBar(
          title: 'Application Pending',
          message: 'Application under review',
        );
        return;
      }



      //remembering
      localStorage.write('email', email.text.trim());
      localStorage.write('password', password.text.trim());
      print("storage");
      //log in user
      final userCredentials = await AuthRepository.instance
          .logInWithEmailAndPassword(email.text.trim(), password.text.trim());
      print("usercredpassed");
      //remove loader
      PFullScreenLoader.stopLoading();
      print("stopload");

      //AuthRepository.instance.screenRedirect();
      Get.offAll(() => NavigationMenu());
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
