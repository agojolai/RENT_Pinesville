import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF939393),
            )),
        centerTitle: true,
      ),
      drawer: Drawer(),
      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25), // some space
            Center(
              child: Column(
                children: [
                  // Main teal container with text
                  Container(
                    //padding: const EdgeInsets.only(left: 16),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 250.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF006989),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        const Text(
                          '     Hi, Juan!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '     Your bill for this month is',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '  P20,000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Bottom container with buttons
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 30),
                          // margin: const EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  //spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle transaction history action
                                    Navigator.pushNamed(
                                        context, '/trans_history');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Color(0xFF006989)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Transaction History',
                                    style: TextStyle(
                                      color: Color(0xFF006989),
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle pay rent action
                                    Navigator.pushNamed(context, '/pay_rent');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Color(0xFF006989)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Pay Rent',
                                    style: TextStyle(
                                      color: Color(0xFF006989),
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/images/IMG.jpg',
                        height: 300,
                      ),
                      Text('Announcements',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
