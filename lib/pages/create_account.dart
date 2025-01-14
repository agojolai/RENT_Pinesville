import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//TODO KULANG SA EXCEPTIONS

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _moveInDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView( //to make page scrollable
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text("Let\'s Create your Account!",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'
                ),),
                SizedBox(height: 16),
                TextFormField(
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
                      borderSide: BorderSide(width: 1, color: Colors.grey)
                    )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your First name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),
                TextFormField(
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
                          borderSide: BorderSide(width: 1, color: Colors.grey)
                      )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Last name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),
                TextFormField(
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
                      borderSide: BorderSide(width: 1, color: Colors.grey)
                    )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                TextFormField(
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
                      borderSide: BorderSide(width: 1, color: Colors.grey)
                    )

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),
                TextFormField(
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
                      borderSide: BorderSide(width: 1, color: Colors.grey)
                    )
                  ),
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
                    Expanded(child:
                    TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Unit No.',
                        labelStyle: TextStyle(
                            color: Color(0xFF939393),
                            fontFamily: 'Poppins',
                            fontSize: 16
                        ),
                        prefixIcon: Icon(Icons.meeting_room_rounded),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(width: 1, color: Colors.grey)
                        )

                        ),
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
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
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
                                borderSide: BorderSide(width: 1, color: Colors.grey),
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Process data.
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: const Text('Sign Up',
                  style: TextStyle(
                    color: Color(0xFF006989),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),),
                ),

              ],

            ),
          ),

        ),
      ),
    );
  }

}

