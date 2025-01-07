import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget{
  void Function()? onTap;

  LoginButton({
    super.key,required this.onTap});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
@override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/grp_page');
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
            color: Color(0xFF006989),
          borderRadius: (BorderRadius.circular(20)),
        ),
        child: const Center(child: Text('Log in',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Color(0xFFFFFFFF),
            ),)),
      ),
    );
  }
}

class newAccButton extends StatefulWidget {
  void Function()? onTap;

  newAccButton({
    super.key,required this.onTap});

  @override
  State<newAccButton> createState() => _newAccButtonState();
}

class _newAccButtonState extends State<newAccButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/create_account');
        },
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF006989),
        borderRadius: (BorderRadius.circular(7)),
      ),
      child: Container(
        child: const Center(child: Text('Create',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Color(0xFFFFFFFF),
          ),
        ),
        ),
      ),
    ),
    );
  }
}