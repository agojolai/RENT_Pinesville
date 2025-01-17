import 'package:flutter/material.dart';

class viewBills extends StatelessWidget {
  const viewBills({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Bills',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal,
              color: Color(0xFF333333),
            ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
      )


    );
  }
}

