import 'package:flutter/material.dart';

class submitReport extends StatelessWidget {
  const submitReport({super.key});


  @override
  Widget build(BuildContext context) {
    String? _selectedValue;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Report',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            ///NAME
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14
                  ),
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(width: 1, color: Colors.grey)
                  )
              ),
            ),

            const SizedBox(height: 20),

            ///EMAIL ADDRESS
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14
                  ),
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(width: 1, color: Colors.grey)
                  )
              ),
            ),

            const SizedBox(height: 20),

            ///CONTACT NUMBER
            TextFormField(
              obscureText: false,
              decoration: InputDecoration(
                  labelText: 'Contact Number',
                  labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14
                  ),
                  prefixIcon: Icon(Icons.phone),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(width: 1, color: Colors.grey)
                  )
              ),
            ),

            const SizedBox(height: 20),
            ///UNIT NUMBER

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Unit No.',
                          labelStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14
                          ),
                          prefixIcon: Icon(Icons.meeting_room_rounded),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey)
                          )
                      ),
                    )),

                SizedBox(width: 10),

                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      )
                    ),

                    ///CATERGORY

                    hint: Text('Category',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),),
                    value: _selectedValue,
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    onChanged: (String? value) {

                    },
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),

            ///DETAILS
            Container(
              height: 200,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),

              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                  hintText: 'Report Description',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  )
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 60.0,
              width: double.infinity,
              child: ElevatedButton(onPressed: () {

              },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF006989),
                      side: const BorderSide(
                          color: Color(0xFF006989)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )
                  ),
                  child: const Text('Submit',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),)),
            )
          ],
        ),

      ),


    );
  }

}