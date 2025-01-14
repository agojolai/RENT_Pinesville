/*

TODO STEP 1 CREATE MODEL

 */

class UserModel {
  final String ? id;
  final String fullName;
  final String email;
  final String password;
  final String phoneNo;
  final String unitNo;
  final String moveInDate;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.unitNo,
    required this.moveInDate,

  });

  toJson(){
    return {
      'FullName': fullName,
      'Email': email,
      'Password': password,
      'Phone': phoneNo,
      'UnitNo': unitNo,
      'MoveInDate': moveInDate,
    };
  }
  }
