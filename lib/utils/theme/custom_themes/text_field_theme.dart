import 'package:flutter/material.dart';

class PTextFormFieldTheme {
  PTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: const TextStyle().copyWith(
      // color: Colors.grey,
      //  fontFamily: 'Poppins',
        fontSize: 14,
      ),
      hintStyle: const TextStyle().copyWith(
        // color: Colors.grey,
        // fontFamily: 'Poppins',
        fontSize: 14,
      ),
      errorStyle: const TextStyle().copyWith(
        // color: Colors.red,
        // fontFamily: 'Poppins',
       // fontSize: 14,
        fontStyle: FontStyle.normal,
      ),
      floatingLabelStyle: TextStyle().copyWith(color: Colors.black.withValues(alpha: 0.8)),

      enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1, color: Colors.grey)),
      focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1, color: Colors.grey)),
      errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1, color: Colors.red)),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 2, color: Colors.orange)),

  );
}
