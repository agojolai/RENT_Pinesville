import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

//bool _isLoading = false;

class _ProfileScreenState extends State<ProfileScreen> {

  //GLOBAL VARIABLES
  File? _avatarImage;


  //ALERT DIALOGUE FUNCTIONS
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




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: const Text('Profile',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Color(0xFF939393),
            )),
        centerTitle: true,
      ),
      body: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //di gumagana ang center
                    children: [
                      Center(
                        child: Row(
                          children: [
                            ClipRRect(
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
                                  'fdgdhdg',
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    color: Color(0xFF006989),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Unit  ',
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    // color: Color(0xFF006989),
                                  ),
                                ),
                                SizedBox(height: 3),
                                GestureDetector(
                                  onTap: () {
                                  },
                                  child: Text(
                                    'Upload a Photo',
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
                        leading: Icon(Iconsax.direct),
                        title: Text('Email',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              //fontSize: 12,
                              color: Colors.black,
                            )),
                        subtitle: Text( 'sddsgbd',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              //fontSize: 14,
                              color: Colors.black,
                            )),
                      ),
                      ListTile(
                        leading: Icon(Iconsax.call),
                        title: Text(
                          'Contact Number',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            //fontSize: 12,
                          ),
                        ),
                        subtitle: Text('sfgdsbfgh',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              //fontSize: 14,
                              color: Colors.black,
                            )),
                      ),
                      ListTile(
                        leading: Icon(Iconsax.calendar),
                        title: Text('Move-in Date',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              //fontSize: 14,
                              color: Colors.black,
                            )),
                        subtitle: Text( '',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              // fontSize: 14,
                              color: Colors.black,
                            )),
                      ),
                      //Spacer(),
                      Divider(), // -------------- yan yon
                      ListTile(
                        leading: Icon(Iconsax.info_circle),
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
                        leading: Icon(Iconsax.danger),
                        title: Text('Submit a Report',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              //fontSize: 14,
                              color: Colors.black,
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, '/Billings/submit_report');
                          // Add navigation to About page
                        },
                      ),
                      ListTile(
                        leading: Icon(Iconsax.setting),
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
                        leading: Icon(Iconsax.undo),
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
                ),
    )
    );
            }
          }


