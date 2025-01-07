import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final controller;
  final String hintText;


  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: (BorderRadius.circular(20)),
                borderSide: const BorderSide(color: Color(0xFFF6F5F5))
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF6F5F5))
            ),
            fillColor: const Color(0xFFF6F5F5),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF939393),
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
            prefixIcon: Icon(Icons.email),
        ),
      ),
    );
  }
}


class PasswordTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: (BorderRadius.circular(20)),
              borderSide: const BorderSide(color: Color(0xFF939393))
          ),

          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF939393))
          ),

          fillColor: const Color(0xFFF6F5F5),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF939393),
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
          prefixIcon: const Icon(Icons.lock_open),
        ),
      ),
    );
  }

}