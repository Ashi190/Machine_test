import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NextScreen(),
  ));
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Next Screen", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Center(
              child: Text(
                "DealsDray", // Replace with your logo
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
            SizedBox(height: 40),
            // "Let's Begin!" Text
            Text(
              "Let's Begin!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please enter your credentials to proceed",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            // Email Text Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            // Password Text Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Create Password',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility), // Add functionality for visibility toggle
              ),
              obscureText: true, // Masks the text for password input
            ),
            SizedBox(height: 20),
            // Referral Code Text Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Referral Code (Optional)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            // Next Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Add your button action here
                  print("Next button pressed");
                },
                child: Icon(Icons.arrow_forward),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Button color
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
