import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/bindings/general_bindings.dart';
import 'package:untitled/utils/theme/theme.dart';
import 'features/authentication/screens/login/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: PAppTheme.lightTheme,
        initialBinding: GeneralBindings(),
        home: LoginScreen());
  }
}

