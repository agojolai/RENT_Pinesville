import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

//bool _isLoading = false;

class _ProfilePageState extends State<ProfilePage> {
  File? _avatarImage;
  final ImagePicker _picker = ImagePicker();

  // Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _dbStore = FirebaseFirestore.instance;

  //ALERT DIALOGUE
  void _userLogOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Confirm Log Out",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          content: const Text("Are you sure you want to log out?",
              style: TextStyle(fontFamily: 'Montserrat')),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog without logging out
                Navigator.of(context).pop();
              },
              child: const Text(
                "No",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                // Log out the user
                await Future.delayed(const Duration(seconds: 1));
                Navigator.of(context).pop(); // Close the dialog
                FirebaseAuth.instance.signOut();
              },
              child: const Text(
                "Yes",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        );
      },
    );
  } //LOG OUT FUNCTION

  // METHOD to fetch user data from Firestore
  Future<Map<String, dynamic>> _fetchUserData() async {
    User? user = _auth.currentUser;
    if (user == null) throw Exception("User not logged in");

    DocumentSnapshot userDoc =
        await _dbStore.collection('users').doc(user.uid).get();

    if (userDoc.exists) {
      return userDoc.data() as Map<String, dynamic>;
    } else {
      throw Exception("User data not found");
    }
  } //END OF METHOD RETRIEVE

  //IMAGE PICKER FUNCTION
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _avatarImage = File(image.path);
      });
    }
  } //END OF FUNCTION

//FETCH USER DATA METHOD
  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the page loads
  } //END OF METHOD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Color(0xFF939393),
            )),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: _fetchUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No user data available"));
            } else {
              // Extract data
              final userData = snapshot.data!;
              final fullName = userData['fullName'] as String?;
              final email = userData['email'] as String?;
              final phoneNo = userData['phoneNo'] as String?;
              final unitNo = userData['unitNo'] as String?;
              final moveInDate = userData['moveInDate'] as String?;

              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //di gumagana ang center
                  children: [
                    Center(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: _pickImage, // Trigger image picker on tap
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: _avatarImage != null
                                  ? FileImage(_avatarImage!)
                                  : NetworkImage(
                                          'https://via.placeholder.com/150')
                                      as ImageProvider,
                              child: _avatarImage == null
                                  ? Icon(Icons.camera_alt,
                                      size: 24, color: Colors.white)
                                  : null,
                            ),
                          ),
                          SizedBox(width: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // Aligns text to the left
                            // mainAxisAlignment: MainAxisAlignment.spaceAround, // Centers vertically within the column
                            children: [
                              Text(
                                fullName ?? '',
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  color: Color(0xFF006989),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Unit ${unitNo ?? ''}',
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  // color: Color(0xFF006989),
                                ),
                              ),
                              SizedBox(height: 3),
                              GestureDetector(
                                onTap: () {
                                  // Add edit profile logic here
                                  print("Edit Profile Tapped");
                                },
                                child: Text(
                                  'Edit profile',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Color(0xFF006989)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            //fontSize: 12,
                            color: Colors.black,
                          )),
                      subtitle: Text(email ?? '',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            //fontSize: 14,
                            color: Colors.black,
                          )),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(
                        'Contact Number',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          //fontSize: 12,
                        ),
                      ),
                      subtitle: Text(phoneNo ?? '',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            //fontSize: 14,
                            color: Colors.black,
                          )),
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Move-in Date',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            //fontSize: 14,
                            color: Colors.black,
                          )),
                      subtitle: Text(moveInDate ?? '',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            // fontSize: 14,
                            color: Colors.black,
                          )),
                    ),
                    //Spacer(),
                    Divider(), // -------------- yan yon
                    ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text('About',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            //fontSize: 14,
                            color: Colors.black,
                          )),
                      onTap: () {
                        // Add navigation to About page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            //fontSize: 14,
                            color: Colors.black,
                          )),
                      onTap: () {
                        // Add navigation to Settings page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log out',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            //fontSize: 14,
                            color: Colors.black,
                          )),
                      onTap: () {
                        // Add log-out logic here
                        //signUserOut();
                        _userLogOut(context);
                      },
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
