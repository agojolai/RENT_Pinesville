import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/data/repository/auth_repository/auth_repo.dart';
import 'app.dart';
import 'firebase_options.dart';

//Entry point of the app

Future<void> main() async {
  //init local storage
  await GetStorage.init();

  //await splash
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthRepository()),
  );

  // Initialize Firebase App Check
  await FirebaseAppCheck.instance.activate(
    // You can use different providers based on the platform
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );

  // initialize authentication

  runApp(const App());
}
