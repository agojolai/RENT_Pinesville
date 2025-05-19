/*


 */

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
 // final String password;
  final String phoneNo;
  final String unitNo;
  final String moveInDate;
  final String profilePic;

  const UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
   // required this.password,
    required this.phoneNo,
    required this.unitNo,
    required this.moveInDate,
    required this.profilePic,
  });

  String get fullName => '$firstName $lastName';

  static List<String> nameParts(fullName) => fullName.split(" ");

  // Static function to create an empty user model.
  static UserModel empty() => UserModel(
        id: "",
        firstName: "",
        lastName: "",
        email: "",
        unitNo: "",
        phoneNo: "",
        moveInDate: "",
        profilePic: "",
        // password: ''
      );

  // Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      //if (id != null)
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      // 'Password': password,
      'Phone': phoneNo,
      'UnitNo': unitNo,
      'MoveInDate': moveInDate,
      'ProfilePic': profilePic,
    };
  }

  // Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null){
    final data = document.data()!;
    return UserModel(
      id: document.id,
      firstName: data['FirstName'] ?? "",
      lastName: data['LastName'] ?? "",
      email: data['Email'] ?? "",
      unitNo: data['UnitNo'] ?? "",
      phoneNo: data['Phone'] ?? "",
      profilePic: data['ProfilePic'] ?? "",
      moveInDate: data['MoveInDate'] ?? "",
      // password: '',
    );
  } else {
      return UserModel.empty();
    }
  }

  }

