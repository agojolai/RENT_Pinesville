import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';

class payBills extends StatefulWidget {
  const payBills({super.key});

  @override
  State<payBills> createState() =>  _PayBillsState();

}



class _PayBillsState extends State<payBills> {

  File? _billsImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async{
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null){
        _billsImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  
  Future<void> _uploadImage() async {
    if (_billsImage == null) return;
    
    var uri = Uri.parse('YOUR_UPLOAD_URL');
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      _billsImage!.path,
      contentType: MediaType('image', 'jpeg'),
    ));

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Image uploade failed: ${response.statusCode}');
      }
    } catch (e) {
        print('Error uploading image: $e');
      }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pay Bills',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0, // Remove shadow
        backgroundColor: Colors.white, // Match background
        iconTheme: const IconThemeData(color: Colors.black), // Back button color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusts space between elements
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerLeft, // Aligns the content to the left
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Ensures all children in the column are aligned to the left
                    children: [

                      const SizedBox(height: 20),

                      const Text(
                        'Online Payment',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),

                      const SizedBox(height: 8),

                    ],
                  ),
                ),

                const SizedBox(height: 20),

                ExpansionTile(
                  title: const Text('GCash Payment',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    )
                  ),
                  children: <Widget>[
                    Builder(
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/gcash.jpg', // Ensure this path is correct
                                  width: 500,
                                  height: 500,
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),

                          );
                        },
                    ),

                  ],
                ),

                ExpansionTile(
                    title: const Text("SeaBank Payment",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  children: <Widget>[
                    Builder(
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/seabank.jpg', // Ensure this path is correct
                                  width: 500,
                                  height: 500,
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                  ],
                ),

                /*GCash Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/gcash.jpg', // Ensure this path is correct
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),*/

                const SizedBox(height: 20),

                // SeaBank Section
                /*Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/seabank.jpg', // Ensure this path is correct
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(height: 4),

                    ],
                  ),
                ),*/

                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _billsImage == null
                    ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 50, color: Colors.grey,),
                        SizedBox(height: 10),
                        Text(
                          'Tap to upload image',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.grey
                          ),
                        )
                      ],
                    )
                        : Image.file(
                      _billsImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    // Add functionality for the button here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF006989), // Button color
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Submit Proof of Payment',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
