import 'package:flutter/material.dart';


//!!!NAME TO BE CHANGED!!!!!
class TransHistoryPage extends StatelessWidget {
  const TransHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text(
          'Transaction History',
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

    );
  }
}


