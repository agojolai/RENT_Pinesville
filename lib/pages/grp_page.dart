import 'package:flutter/material.dart';
import 'package:untitled/pages/announcements_page.dart';
import 'package:untitled/pages/chat_page.dart';
import 'package:untitled/pages/home_page.dart';

class GrpPage extends StatefulWidget{
  GrpPage({super.key});

  @override
  State<GrpPage> createState() => _GrpPageState();
}

class _GrpPageState extends State<GrpPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    //home_page
    HomePage(),
    //announcement_page
    AnnouncementsPage(),
    //chat_page
    ChatPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: _pages[_selectedIndex],
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.announcement_rounded),
              label: 'Announcements'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat Admin',

          ),
        ],

        selectedItemColor: const Color(0xFF006989),
        unselectedItemColor: const Color(0xFF939393),
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 9,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 9,
        ),
      ),
    );


  }
}