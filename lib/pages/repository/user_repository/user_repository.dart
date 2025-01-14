  /*

  TODO STEP 2 USER REPOSITORY TO PERFORM DATABASE OPERATIONS

   */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection('Users').add(user.toJson()).whenComplete(
        () => Get.snackbar('Success', 'User Created.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
        colorText: Colors.green),
    )
        .catchError((error, StackTrace) {
          Get.snackbar('Error', 'Please Try Again',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.withValues(alpha: 0.1),
              colorText: Colors.red);
          print(error.toString());
    });
  }
}