import 'package:flutter/material.dart';

class PElevatedButtonTheme {
  PElevatedButtonTheme._();

  //LIGHT THEME
static final BiglightTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF006989),
    padding: const EdgeInsets.symmetric(vertical: 20),
    textStyle: const TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      //color: Colors.white,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  )
);

//TODO DI KO PA NAPAPAGANA SA THEME.DART
  static final SmalllightTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF006989)),
        //padding: const EdgeInsets.symmetric(vertical: 20),
          textStyle: TextStyle(
            color: Color(0xFF006989),
            fontFamily: 'Montserrat',
            fontSize: 12,
          ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      )
  );

  //DARK THEME NA DI PA MAIIMPLEMENT
}