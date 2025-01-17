import 'package:flutter/material.dart';

class submitBills extends StatelessWidget {
  const submitBills({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text(
          'Submit Bills',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
            color: Color(0xFF939393),
          )
      ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                          'COMING SOON',
                        ),
                        Text('!!!NAME TO BE CHANGED!!!!!'),
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

