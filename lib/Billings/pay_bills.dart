import 'package:flutter/material.dart';

class payBills extends StatelessWidget {
  const payBills({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pay Bills',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal,
              color: Color(0xFF333333),
            ),
          ),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(25),
        )


    );
  }
}

