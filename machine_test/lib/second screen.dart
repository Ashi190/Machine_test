import 'dart:convert'; // For JSON encoding and decoding
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test/thirdscreen.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String kycStatus = 'Loading...'; // Default value until API call finishes

  @override
  void initState() {
    super.initState();
    fetchKYCStatus(); // Call the API when the screen is initialized
  }

  // Function to make a GET request to the API
  Future<void> fetchKYCStatus() async {
    final url = Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/device/add'); // Use the correct API endpoint
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer your_token_here', // Add authorization token if required
      },
    );

    if (response.statusCode == 200) {
      // If the server returns an OK response, parse the JSON data
      final data = jsonDecode(response.body);
      setState(() {
        kycStatus = data['kycStatus']; // Adjust based on the actual API response
      });
    } else {
      // If the response was not successful, show an error message
      setState(() {
        kycStatus = 'Failed to load KYC status';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    kycStatus, // Display the fetched KYC status
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildIcon(context, Icons.phone_iphone, 'Mobile'),
                  _buildIcon(context, Icons.laptop, 'Laptop'),
                  _buildIcon(context, Icons.camera_alt, 'Camera'),
                  _buildIcon(context, Icons.tv, 'LED'),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Exclusive For You',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()),
                  );
                },
                child: Text('Go to Third Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context, IconData icon, String label) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon, size: 40),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdScreen()),
            );
          },
        ),
        Text(label),
      ],
    );
  }
}
