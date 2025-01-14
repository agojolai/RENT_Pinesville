import 'package:flutter/material.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFFFF),
        ),),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Heading
            const Text('Foget Password',
            style: TextStyle(
              color: Color(0xFF006989),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),),

            const SizedBox(height: 8),

            const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(
              color: Color(0xFF000000),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              fontSize: 10,
            ),),

            const SizedBox(height: 25),
            ///Text Field
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(
                    color: Color(0xFF939393),
                    fontFamily: 'Poppins',
                    fontSize: 12
                  ),
                  prefixIcon: const Align(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: Icon(Icons.email),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 1, color: Colors.grey)
                  )
                )
            ),

            const SizedBox(height: 25),

            SizedBox(
              height: 40.0,
              width: double.infinity,
              child: ElevatedButton(onPressed: () {

              }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF006989),
                    side: const BorderSide(
                      color: Color(0xFF006989)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  ),
                  child: const Text('Submit',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'Poppins',
              ),)),
            )



            ///Submit Button
            


          ],
        ),
      ),
    );
  }
}


