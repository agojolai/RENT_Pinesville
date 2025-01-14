import 'package:flutter/material.dart';

class chatAdminPage extends StatelessWidget {
  const chatAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Chat Admin',
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
