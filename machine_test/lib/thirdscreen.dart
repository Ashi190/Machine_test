import 'package:flutter/material.dart';
import 'dart:math';

import 'package:machine_test/fourthscreen.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  String inputValue = '';
  bool isPhoneSelected = true;

  // Method to generate a random 6-digit OTP
  String generateOtp() {
    var random = Random();
    int otp = 100000 + random.nextInt(900000); // Generates a random 6-digit number
    return otp.toString();
  }

  void sendOtp() {
    String otp = generateOtp();
    print('OTP sent: $otp'); // Simulate sending OTP
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP sent to ${isPhoneSelected ? 'Phone' : 'Email'}: $otp')), // live send message API call
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FourthScreen(otp: otp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Placeholder for Logo
            Container(
              child: Text(
                "DealsDray", // Replace with the actual logo widget if available.
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Toggle Buttons for Phone/Email
            ToggleButtons(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Phone'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Email'),
                ),
              ],
              isSelected: [isPhoneSelected, !isPhoneSelected],
              onPressed: (int index) {
                setState(() {
                  isPhoneSelected = index == 0;
                });
              },
              selectedColor: Colors.white,
              fillColor: Colors.red,
              borderRadius: BorderRadius.circular(30.0),
              borderColor: Colors.grey,
              selectedBorderColor: Colors.red,
            ),
            SizedBox(height: 40),
            // "Glad to see you!" Text
            Text(
              'Glad to see you!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            // Subtitle Text
            Text(
              'Please provide your ${isPhoneSelected ? 'phone number' : 'email address'}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            // Phone or Email Text Field
            TextField(
              decoration: InputDecoration(
                labelText: isPhoneSelected ? 'Phone' : 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: isPhoneSelected ? TextInputType.phone : TextInputType.emailAddress, // Sets the appropriate keyboard type
              onChanged: (value) {
                setState(() {
                  inputValue = value;
                });
              },
            ),
            SizedBox(height: 20),
            // Send Code Button
            ElevatedButton(
              onPressed: () {
                if (inputValue.isNotEmpty) {
                  sendOtp();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter your ${isPhoneSelected ? 'phone number' : 'email address'}')),
                  );
                }
              },
              child: Text(
                'SEND CODE',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red, backgroundColor: Colors.red[100], // Text color
                minimumSize: Size(double.infinity, 50), // Make the button full-width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 