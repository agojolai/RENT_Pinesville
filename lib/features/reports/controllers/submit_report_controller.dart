import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
