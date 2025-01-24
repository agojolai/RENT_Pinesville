import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {
  final String? id; // Firestore document ID
  final String name;
  final String email;
  final String phoneNo;
  final String unitNo; // Acts as a foreign key
  final String category;
  final String reportDesc;
  final String reportDate;

  const ReportModel({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.unitNo,
    required this.category,
    required this.reportDesc,
    required this.reportDate,
  });

  // Static function to create an empty report model
  static ReportModel empty() => ReportModel(
    id: "",
    name: "",
    email: "",
    phoneNo: "",
    unitNo: "",
    category: "",
    reportDesc: "",
    reportDate: "",
  );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Email': email,
      'PhoneNo': phoneNo,
      'UnitNo': unitNo,
      'Category': category,
      'ReportDesc': reportDesc,
      'ReportDate': reportDate,
    };
  }

  // Factory method to create a ReportModel from a Firebase document snapshot
  factory ReportModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ReportModel(
        id: document.id,
        name: data['Name'] ?? "",
        email: data['Email'] ?? "",
        phoneNo: data['PhoneNo'] ?? "",
        unitNo: data['UnitNo'] ?? "",
        category: data['Category'] ?? "",
        reportDesc: data['ReportDesc'] ?? "",
        reportDate: data['ReportDate'] ?? "",
      );
    } else {
      return ReportModel.empty();
    }
  }
}
