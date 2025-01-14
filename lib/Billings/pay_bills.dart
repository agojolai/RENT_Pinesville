import 'package:flutter/material.dart';

class payBills extends StatelessWidget {
  const payBills({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusts space between elements
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft, // Aligns the content to the left
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Ensures all children in the column are aligned to the left
                    children: [
                      const Text(
                        'Online Payment',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                // GCash Section
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
                ),
                const SizedBox(height: 20),
                // SeaBank Section
                Container(
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
                ),
              ],
            ),
            // Proof of Payment Button
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
                'Proof of Payment',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
