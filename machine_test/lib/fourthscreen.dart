import 'package:flutter/material.dart';
import 'package:machine_test/nextscreen.dart';

class FourthScreen extends StatefulWidget {
  final String otp;  // OTP that the user is expected to enter

  const FourthScreen({required this.otp});

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  String enteredOtp = '';  // This stores the entered OTP from the user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);  // This pops back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Instructions Text
            Text(
              'Please enter the OTP sent to your phone/email',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // OTP Text Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  enteredOtp = value;  // Update entered OTP on change
                });
              },
            ),
            SizedBox(height: 30),
            // Verify OTP Button
            ElevatedButton(
              onPressed: () {
                // OTP verification logic
                print('Entered OTP: $enteredOtp'); // Debug output
                print('Expected OTP: ${widget.otp}'); // Debug output

                if (enteredOtp == widget.otp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('OTP verified successfully!')),
                  );

                  // Navigate to the next screen after OTP verification
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextScreen(),  // Replace with your actual next screen widget
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid OTP, please try again.')),
                  );
                }
              },
              child: Text(
                'VERIFY OTP',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red, // Text color
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
