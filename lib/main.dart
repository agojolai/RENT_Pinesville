import 'package:flutter/material.dart';
import 'package:untitled/pages/create_account.dart';
import 'package:untitled/pages/grp_page.dart';
import 'package:untitled/pages/login_page.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/pages/announcements_page.dart';
import 'package:untitled/pages/chat_page.dart';
import 'package:untitled/pages/trans_history_page.dart';
import 'package:untitled/pages/pay_rent_page.dart';
import 'package:firebase_core/firebase_core.dart';
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
      home: LoginPage(),
      routes: {
    '/login_page': (context) => LoginPage(),
    '/create_account': (context) => SignUpScreen(),
    '/grp_page': (context) => GrpPage(),
    '/home_page': (context) => HomePage(),
    '/announcements_page': (context) => AnnouncementsPage(),
    '/chat_page': (context) => ChatPage(),
    '/pay_rent': (context) => PayRentPage(),
    '/trans_history': (context) => TransHistoryPage(),
    },
    );
  }
}
