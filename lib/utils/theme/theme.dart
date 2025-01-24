import 'package:flutter/material.dart';
import 'package:untitled/utils/theme/custom_themes/text_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
// TODO MAKE THEME SA NEXT WAVE
class PAppTheme{
  PAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3:true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: PTextTheme.lightTextTheme,
    elevatedButtonTheme: PElevatedButtonTheme.BiglightTheme,
    //elevatedButtonTheme: PElevatedButtonTheme.SmalllightTheme,
    inputDecorationTheme: PTextFormFieldTheme.lightInputDecorationTheme,


  );

 /* static ThemeData darkTheme = ThemeData(
    useMaterial3:true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: PTextTheme.darkTextTheme,
  );

  */
}