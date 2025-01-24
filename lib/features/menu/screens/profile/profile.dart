
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled/features/reports/screens/submit_report.dart';

import '../../../../data/repository/auth_repository/auth_repo.dart';
import '../../../personalization/controllers/user_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

//bool _isLoading = false;

class _ProfileScreenState extends State<ProfileScreen> {
  //GLOBAL VARIABLES

  //ALERT DIALOGUE FUNCTIONS
  void _userLogOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Log Out"),
          content: const Text(
            "Are you sure you want to log out?",
          ),
          actions: [
            TextButton(
              child: const Text("No",),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                AuthRepository.instance.logout();
              },
            ),
          ],
        );
      },
    );
  } //LOG OUT FUNCTION

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    controller.fetchUserRecord();
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
              backgroundImage: controller.user.value?.profilePic.isNotEmpty == true
                  ? NetworkImage(controller.user.value!.profilePic)  // Use URL if available
                  : NetworkImage('https://via.placeholder.com/150') as ImageProvider,  // Fallback image
              child: controller.user.value?.profilePic.isEmpty == true
                  ? Icon(Icons.camera_alt, size: 24, color: Colors.white)
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
                            controller.user.value!.fullName,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: Color(0xFF006989),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Unit ${controller.user.value?.unitNo}  ',
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              // color: Color(0xFF006989),
                            ),
                          ),
                          SizedBox(height: 3),
                          GestureDetector(
                            onTap: () => controller.uploadUserProfilePicture(),
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
                  subtitle: Text('${controller.user.value?.email}',
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
                  subtitle: Text('${controller.user.value?.phoneNo}',
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
                  subtitle: Text('${controller.user.value?.moveInDate}',
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
                  onTap: () => Get.to(() => SubmitReport()),
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
                      //AuthRepository.instance.logout();
                    }),
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
                    _userLogOut(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
