import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Billings/pay_bills.dart';
import 'package:untitled/Billings/submit_report.dart';
import 'package:untitled/Billings/submit_bills.dart';
import 'package:untitled/Billings/transaction_history.dart';
import 'package:untitled/Billings/view_bills.dart';
import 'package:untitled/features/password_configuration/forgot_password.dart';
import 'package:untitled/pages/navigation/ProfilePage.dart';
import 'package:untitled/pages/navigation/home_page.dart';
import 'package:untitled/pages/auth_page.dart';
import 'package:untitled/pages/create_account.dart';
import 'package:untitled/pages/grp_page.dart';
import 'package:untitled/pages/pay_rent_page.dart';
import 'package:untitled/pages/trans_history_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        '/login_page': (context) => AuthPage(),
        '/create_account': (context) => SignUpScreen(),
        '/grp_page': (context) => GrpPage(),
        '/home_page': (context) => HomePage(),
        '/ProfilePage': (context) => ProfilePage(),
        '/pay_rent': (context) => PayRentPage(),
        '/trans_history': (context) => TransHistoryPage(),
        '/features/password_configuration': (context) => forgetPassword(),
        '/Billings/view_bills': (context) => viewBills(),
        '/Billings/transaction_history': (context) => transactionHistory(),
        '/Billings/pay_bills': (context) => payBills(),
        '/Billings/submit_report': (context) => submitReport(),
        '/Billings/submit_bills': (context) => submitBills(),
      },
    );
  }
}
