import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


//TODO KULANG SA EXCEPTIONS

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  // Controllers for input fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _unitNoController = TextEditingController();
  final TextEditingController _moveInDateController = TextEditingController();

  // Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Loading state
  bool _isLoading = false;

  // Method to handle user registration
  Future<void> _registerUser() async {
    setState(() {
      _isLoading = true;
    });

    try {

      // Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Firestore User Data
      String uid = userCredential.user!.uid;
      await _firestore.collection('users').doc(uid).set({
        'fullName': "${_firstNameController.text.trim()} ${_lastNameController.text.trim()}",
        'email': _emailController.text.trim(),
        'phoneNo': _phoneNoController.text.trim(),
        'unitNo': _unitNoController.text.trim(),
        'moveInDate': _moveInDateController.text.trim(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account created successfully!')),
      );

      // Navigate or clear fields after successful registration
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                //to make page scrollable
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      const Text(
                        "Let\'s Create your Account!",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                              color: Color(0xFF939393),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(Icons.person),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your First name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                              color: Color(0xFF939393),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(Icons.person),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Color(0xFF939393),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(Icons.email),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneNoController,
                        decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              color: Color(0xFF939393),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Color(0xFF939393),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //unit no.
                          Expanded(
                              child: TextFormField(
                            controller: _unitNoController,
                            decoration: InputDecoration(
                                labelText: 'Unit No.',
                                labelStyle: TextStyle(
                                    color: Color(0xFF939393),
                                    fontFamily: 'Poppins',
                                    fontSize: 16),
                                prefixIcon: Icon(Icons.meeting_room_rounded),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your unit no.';
                              }
                              return null;
                            },
                          )),
                          SizedBox(width: 20),

                          //move in date
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  _moveInDateController.text = formattedDate;
                                }
                              },
                              child: AbsorbPointer(
                                child: TextFormField(
                                  controller: _moveInDateController,
                                  decoration: InputDecoration(
                                    labelText: 'Move-in Date',
                                    labelStyle: TextStyle(
                                      color: Color(0xFF939393),
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                    prefixIcon: Icon(Icons.calendar_month),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select move-in date.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _registerUser,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF006989),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNoController.dispose();
    _unitNoController.dispose();
    _moveInDateController.dispose();
    super.dispose();
  }
}
