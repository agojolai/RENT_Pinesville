  /*

  TODO STEP 2 USER REPOSITORY TO PERFORM DATABASE OPERATIONS

   */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/features/authentication/models/user_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
/*
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
*/

Future<void> saveUserRecord(UserModel user) async {
  try {
    await _db.collection('Users').doc(user.id).set(user.toJson());
  } on FirebaseException catch (e) {
    throw PFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const PFormatException();
  } on PlatformException catch (e) {
    throw PPlatformException(e.code).message;
  } catch (e) {
    throw Exception('Error saving user record: $e');
  } //return;
}
}