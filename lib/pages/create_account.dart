import 'package:flutter/material.dart';

class CreateAccPage extends StatelessWidget {
  const CreateAccPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 5),

            //new acc text
              Text(
                  'New Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF939393),

                  ),
                 // textAlign: TextAlign.center,
              ),

            //name text
              Text("Name",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins'
              )
              ),
            //textfield name

            //email text

            //textfield email

            //password text

            //textfield password

            //contact number text

            //txtfield contact no

            //unit no text NAKA ROW

            //txtfield unit no.

            //move in date text


            //textfield or calendar txtfield

            ],
          )
      ),
      // Integrating the BillCard widget here

    );
  }
}


