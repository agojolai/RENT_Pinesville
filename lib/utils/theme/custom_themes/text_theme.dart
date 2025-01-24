import 'package:flutter/material.dart';

class PTextTheme {
  PTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
      headlineLarge: TextStyle().copyWith(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        // color: Colors.black
      ),
      headlineMedium: TextStyle().copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        //   color: Colors.black
      ),
      bodyMedium: TextStyle().copyWith(
        fontSize: 18,
       // fontWeight: FontWeight.bold,
        //   color: Colors.black
      ),
      bodySmall: TextStyle().copyWith(
        fontSize: 14,
        // fontWeight: FontWeight.bold,
        //color: Colors.black
      ),
      labelSmall: TextStyle().copyWith(
      fontSize: 12,
      // fontWeight: FontWeight.bold,
      //color: Colors.black
    ),
  ); //lightTextTheme



  //DI KO MUNA GAGAMITIN
  static TextTheme darkTextTheme = TextTheme();
}
