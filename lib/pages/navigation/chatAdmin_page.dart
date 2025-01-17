import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/* TODO THIS IS JUST A DUMMY SHIT */

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  String userName = '';
  String amount = '0';
  String announcement = 'No Latest Announcements';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            userName = userDoc.data()?['fullName'] ?? 'User';
            amount = userDoc.data()?['amount']?.toString() ?? '0';
          });
        }

        final announcementDoc = await FirebaseFirestore.instance
            .collection('announcements')
            .orderBy('date', descending: true)
            .limit(1)
            .get();

        if (announcementDoc.docs.isNotEmpty) {
          setState(() {
            announcement = announcementDoc.docs.first.data()['content'] ??
                'No Latest Announcements';
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            const SizedBox(height: 25), // some space
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main teal container with text
                Container(
                  height: 226,
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
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        '     Hi, $userName!',
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
                        '  P$amount',
                        style: const TextStyle(
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/Billings/submit_bills');
                              },
                              style: ElevatedButton.styleFrom(
                                side:
                                    const BorderSide(color: Color(0xFF006989)),
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
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/pay_rent');
                              },
                              style: ElevatedButton.styleFrom(
                                side:
                                    const BorderSide(color: Color(0xFF006989)),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Announcement Section
                const Text(
                  'Announcement',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),

                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF006989)),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        announcement == 'No Latest Announcements'
                            ? Icons.info_outline
                            : Icons.announcement,
                        color: const Color(0xFF006989),
                        size: 48.0,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        announcement,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xFF006989),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
