import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/submitpop_controller.dart';

class SubmitProofScreen extends StatelessWidget {
  const SubmitProofScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller using GetX
    final controller = Get.put(SubmitProofController());

    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                const SizedBox(height: 20),
                ExpansionTile(
                  title: const Text('GCash Payment',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      )),
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
                                'assets/images/gcash.jpg',
                                // Ensure this path is correct
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
                SizedBox(width: 20),
                ExpansionTile(
                  title: const Text(
                    "SeaBank Payment",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                  children: <Widget>[
                    Builder(builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/seabank.jpg',
                              // Ensure this path is correct
                              width: 500,
                              height: 300,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: controller.pickImage,  // Call pickImage method from controller
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 200,
                      maxHeight: 600, // max height limit
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(() {
                      return controller.billsImage.value == null
                          ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Tap to upload image',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                          : SingleChildScrollView(
                        child: Image.file(
                          controller.billsImage.value!,
                          fit: BoxFit.contain,
                        ),
                      );
                    }),
                  )
                  ,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.uploadImage,  // Call uploadImage method from controller
                  child: Text("Submit Proof of Payment",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
