import 'package:flutter/material.dart';


class ChatadminPage extends StatefulWidget {
  const ChatadminPage({super.key});

  @override
  State<ChatadminPage> createState() => _ChatadminPageState();
}

class _ChatadminPageState extends State<ChatadminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Admin',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Color(0xFF939393),
            )),
        centerTitle: true,

      ),
      body: Text("Soon")
    );
  }
}
