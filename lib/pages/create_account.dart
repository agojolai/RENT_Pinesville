import 'package:flutter/material.dart';

class CreateAccPage extends StatelessWidget {
  const CreateAccPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text(
          'Pay Rent',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
            color: Color(0xFF939393),
          )
      ),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                        ),
                        Text(
                          'Hello again',
                        ),
                        Text('hello again'),
                      ],
                    )
                  ],
                ),

              )

            ],
          )
      ),
      // Integrating the BillCard widget here

    );
  }
}


