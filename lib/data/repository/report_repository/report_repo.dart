import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/features/reports/models/report_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ReportRepository extends GetxController {
static ReportRepository get instance => Get.find();
  // Firestore instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save report record to Firestore
Future<void> saveReportRecord(ReportModel report) async {
  try {
    await _db.collection('Reports').add(report.toJson());
  } on FirebaseException catch (e) {
      // Handle Firebase-specific exceptions
      throw PFirebaseException(e.code).message;
    } on FormatException catch (_) {
      // Handle JSON or format errors
      throw const PFormatException();
    } on PlatformException catch (e) {
      // Handle platform-specific errors
      throw PPlatformException(e.code).message;
    } catch (e) {
      // Catch all other exceptions
      throw Exception('Error saving report record: $e');
    }
  }
}
