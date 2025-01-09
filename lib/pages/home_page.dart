import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  //sign user out method na ilalagay sa user account page
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //temporary sign out for testing
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ], //testing nga ha oki

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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 25), // some space
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main teal container with text
                  Container(
                    //padding: const EdgeInsets.only(left: 16),
                    //margin: const EdgeInsets.symmetric(horizontal: 20),

                    height: 226, // height of teal container
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF006989),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.5),
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
                                  color: Colors.grey.withValues(alpha: 0.5),
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
                                    'Submit Bills',
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
                                    'View Billing Statement',
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
                  const SizedBox(height: 20),

                  //photos
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'lib/images/IMG.jpg', // Replace with actual image URL
                      height: 150.0,
                      width: double.infinity,
                      fit: BoxFit.cover,

                    ),
                  ),

                  SizedBox(height: 16.0),

                  //announcement
                  const Text(
                    'Announcement',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),

                  Container(
                    //padding: const EdgeInsets.all(40.0),
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF006989)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Added here
                      children: [
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, //to center
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Color(0xFF006989),
                              size: 48.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'No Latest Announcements',
                               style: TextStyle(
                                 fontFamily: 'Poppins',
                                 fontSize: 14,
                                 color: Color(0xFF006989),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  // Explore Tools Section
                  const Text(
                    'Explore Tools',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  const Text(
                    'Making everything from rent to maintenance requests easier',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildToolIcon(Icons.description, 'View\nBills', () {
                        print('Bill Break Down tapped');
                      }),
                      _buildToolIcon(Icons.history, 'Transaction\nHistory', () {
                        print('Transaction History tapped');
                      }),
                      _buildToolIcon(Icons.payment, 'Pay\nBills', () {
                        print('Pay Rent tapped');
                      }),
                      _buildToolIcon(Icons.report, 'Submit a\nReport', () {
                        print('Submit a Report tapped');
                      }),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
} Widget _buildToolIcon(IconData icon, String label, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 75,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0), // Add border
        borderRadius: BorderRadius.circular(8.0), // Optional: make it rounded
      ),
      padding: EdgeInsets.all(8.0), // Add padding inside the border
      child: Column(
        children: [
          Icon(icon, color: Color(0xFF006989), size: 32.0),
          const SizedBox(height: 4.0),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 9,),
          ),
        ],
      ),
    ),
  );
}