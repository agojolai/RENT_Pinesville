import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Announcement',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              color: Color(0xFF939393),
            )),
        centerTitle: true,
      ),

    );
  }
}
