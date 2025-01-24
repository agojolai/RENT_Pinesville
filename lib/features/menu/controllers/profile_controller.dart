import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {
  static  ProfileController get instance => Get.find();

  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
}