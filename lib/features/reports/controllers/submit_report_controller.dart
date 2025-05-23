import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:untitled/utils/popups/full_screen_loader.dart';
import 'package:untitled/utils/popups/loaders.dart';
import '../../../../data/repository/report_repository/report_repo.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../utils/constants/PImages.dart';
import '../models/report_model.dart';

class SubmitReportController extends GetxController {
  static SubmitReportController get instance => Get.find();

  var unitSelectedValue = ''.obs;  // Initialize as empty string or null
  var categorySelectedValue = ''.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final unitNo = TextEditingController();
  final category = TextEditingController();
  final reportDesc = TextEditingController();
  GlobalKey<FormState> submitReportFormKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  var reportImages = <File>[].obs; // Reactive list of image files




  // Pick image from gallery
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (reportImages.length >= 3) {
        PLoaders.errorSnackBar(
          title: 'Limit Reached',
          message: 'You can only upload up to 3 photos.',
        );
        return;
      }
      reportImages.add(File(pickedFile.path));
    }
  }



  // SUBMIT REPORT
  void submitReport() async {
    try {
      // Open loading dialog
      PFullScreenLoader.openLoadingDialog('Submitting Report...', PImages.processData);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        PLoaders.errorSnackBar(
            title: 'Error', message: 'Please check your internet connection');
        return;
      }

      // Form Validation
      if (!submitReportFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // Get current timestamp
      String currentTimestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      List<String> uploadedPhotoUrls = [];

      for (var image in reportImages) {
        final ref = FirebaseStorage.instance
            .ref()
            .child("uploads/reports/${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}");

        final uploadTask = ref.putFile(image);
        final snapshot = await uploadTask;
        final url = await snapshot.ref.getDownloadURL();

        uploadedPhotoUrls.add(url);
      }


      // Save report to database
      // Call the repository to save the report
      // Create a ReportModel from the form data
      final report = ReportModel(
        name: name.text.trim(),
        email: email.text.trim(),
        phoneNo: phoneNo.text.trim(),
        unitNo: unitSelectedValue.value,  // Use the reactive unit value
        category: categorySelectedValue.value,  // Use the reactive category value
        reportDesc: reportDesc.text.trim(),
        reportDate: currentTimestamp,
        reportPhotos: uploadedPhotoUrls, // TODO photo TO BE ADDED OR IDK IF THIS IS CORRECT
        status: ''
      );

      // Call the repository to save the report
      final reportRepository = Get.put(ReportRepository());
      await reportRepository.saveReportRecord(report);

      PFullScreenLoader.stopLoading();
      Get.back();
      // Show success message
      PLoaders.successSnackBar(
          title: 'Success!', message: 'Your report has been submitted successfully.');

    } catch (e) {
      PLoaders.errorSnackBar(title: 'Error', message: e.toString());
      PFullScreenLoader.stopLoading();
    }
  }
}
