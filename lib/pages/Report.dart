import 'package:flutter/material.dart';


class Report extends StatelessWidget{
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.question_mark_rounded),
              iconSize: 20,
              onPressed: () {},
            )
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              buildPaginationRow(context),
              SizedBox(height: 70),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), // Adjust the curve here
                  child: SizedBox(
                    width: 280, // Set the desired width
                    height: 200, // Set the desired height
                    child: Image(
                      image: AssetImage('assetsimage/report.jpg'),
                      fit: BoxFit.cover, // Fit the image within the given size
                    ),
                  ),
                ),
              )
            ]
        )
    );
  }

  Widget buildPaginationRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 10, width: 20,),
        IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.grey),
          iconSize: 20,
          onPressed: () {
          },
        ),
        Text(
          "Report",
          style: TextStyle(
              color: Colors.grey,
              fontFamily: 'Poppins',
              fontSize: 11
          ),
        )
      ],
    );
  }
}