import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/features/billings/screens/billing_statement/billing_statement.dart';
import 'package:untitled/features/billings/screens/submit_pop/sumbitpop.dart';

import '../../../personalization/controllers/user_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            color: Color(0xFF939393),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 228,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF006989),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: .5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        '     Hi, ${controller.user.value?.firstName}!',
                        style: const TextStyle(
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
                      Text(
                        '  P',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha:0.5),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => Get.to(() => SubmitProofScreen()
                                ),
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(color: Color(0xFF006989)),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Text(
                                  'Submit Bills',
                                  style: TextStyle(
                                      color: Color(0xFF006989),
                                      fontFamily: 'Montserrat',
                                      //fontWeight: FontWeight.nor,
                                      fontSize: 10
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                            onPressed: () => Get.to(() => BillingStatement()),
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(color: Color(0xFF006989)),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Text(
                                  'View Billing Statement',
                                  style: TextStyle(
                                    color: Color(0xFF006989),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10
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

                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'assets/images/IMG.jpg', // Replace with actual image URL
                    height: 150.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 16.0),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Announcement',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF006989)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          'No Announcements',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Color(0xFF006989),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    SizedBox(height: 16.0),
                    // TRANSACTION HISTORY SECTIONS
                    const Text(
                      'Transaction History',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),

                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF006989)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // Added here
                            children: [
                              // SizedBox(height: 16.0),

                              Text(
                                'January Bill',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Color(0xFF006989),
                                ),
                              ),
                              Divider(),
                              Text(
                                'December Bill',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Color(0xFF006989),
                                ),
                              ),
                              Divider(),
                              Text(
                                'November Bill',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Color(0xFF006989),
                                ),
                              ),
                              Divider(),
                              Text(
                                'October Bill',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Color(0xFF006989),
                                ),
                              ),
                              Divider(),
                              Text(
                                'September Bill',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Color(0xFF006989),
                                ),
                              ),
                              Divider(),
                              Text(
                                'August Bill',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Color(0xFF006989),
                                ),
                              ),


                              GestureDetector(
                                onTap: () {
                                  // Add edit profile logic here
                                  print("see more tapped");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end, // Align to the right
                                  children: [
                                    Text(
                                      'see more...',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    )

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
