import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  File? _avatarImage;
  final ImagePicker _picker = ImagePicker();

  //sign user out method na ilalagay sa user account p age
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _avatarImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            //fontWeight: FontWeight.bold,
            color: Color(0xFF939393),
          )
      ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //di gumagana ang center
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
                            : NetworkImage('https://via.placeholder.com/150')
                        as ImageProvider,
                        child: _avatarImage == null
                            ? Icon(Icons.camera_alt, size: 24, color: Colors.white)
                            : null,
                    ),
                  ),
                  SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                   // mainAxisAlignment: MainAxisAlignment.spaceAround, // Centers vertically within the column
                    children: [
                      const Text(
                        'Juan Dela Cruz',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          color: Color(0xFF006989),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Unit 101- A',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                            fontSize: 14,
                           // color: Color(0xFF006989),

                        ),
                      ),
                      SizedBox(height: 3),
                      GestureDetector(
                        onTap: () {
                          // Add edit profile logic here
                          print("bobo");
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
              subtitle: Text('juandelacruz@gmail.com',
              style: TextStyle(
                fontFamily: 'Montserrat',
                //fontSize: 14,
                color: Colors.black,
              )),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact Number',
              style: TextStyle(
                fontFamily: 'Montserrat',
                //fontSize: 12,
    ),),
              subtitle: Text('(+63) 9123456780',
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
              subtitle: Text('January 11, 2024',
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
                signUserOut();
                //print("hoi");
              },
            ),

          ],
        ),
      ),


    );
  }
}


