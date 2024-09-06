import 'package:flutter/material.dart';
import 'package:machine_test/second%20screen.dart';
import 'package:machine_test/thirdscreen.dart'; // Import the ThirdScreen
import 'api_service.dart'; // Import your ApiService class file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Machine App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image1.png'), // Replace with your image
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Title Text',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'This is a description text that aligns with the design provided.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Go to Second Screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },
              child: Text('Go to verification Screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ApiTestScreen()),
                );
              },
              child: Text('Run API Calls'),
            ),
          ],
        ),
      ),
    );
  }
}



class ApiTestScreen extends StatefulWidget {
  @override
  _ApiTestScreenState createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  final ApiService apiService = ApiService();
  String _statusMessage = '';

  Future<void> performApiCalls() async {
    setState(() {
      _statusMessage = 'Starting API calls...';
    });

    bool deviceAdded = await apiService.addDevice(
      deviceType: 'andriod',
      deviceId: 'C6179909526098',
      deviceName: 'Samsung-MT200',
      deviceOSVersion: '2.3.6',
      deviceIPAddress: '11.433.445.66',
      lat: 9.9312,
      long: 76.2673,
      buyerGcmid: '',
      buyerPemid: '',
      appVersion: '1.20.5',
      installTimeStamp: '2022-02-10T12:33:30.696Z',
      uninstallTimeStamp: '2022-02-10T12:33:30.696Z',
      downloadTimeStamp: '2022-02-10T12:33:30.696Z',
    );

    if (deviceAdded) {
      setState(() {
        _statusMessage = 'Device added successfully. Requesting OTP...';
      });

      bool otpRequested = await apiService.requestOtp('9011470243', '62b341aeb0ab5ebe28a758a3');
      if (otpRequested) {
        setState(() {
          _statusMessage = 'OTP requested. Verifying OTP...';
        });

        bool otpVerified = await apiService.verifyOtp('9879', '62b43472c84bb6dac82e0504', '62b43547c84bb6dac82e0525');
        if (otpVerified) {
          setState(() {
            _statusMessage = 'OTP verified. Sending referral...';
          });

          bool referralSent = await apiService.sendEmailReferral(
            email: 'muhammedrafnasvk@gmail.com',
            password: '1234Rafnas',
            referralCode: 12345678,
            userId: '62a833766ec5dafd6780fc85',
          );
          if (referralSent) {
            setState(() {
              _statusMessage = 'Referral sent. Fetching home data...';
            });

            await apiService.getHomeWithoutPrice();
            setState(() {
              _statusMessage = 'Home data fetched successfully.';
            });
          } else {
            setState(() {
              _statusMessage = 'Failed to send referral.';
            });
          }
        } else {
          setState(() {
            _statusMessage = 'Failed to verify OTP.';
          });
        }
      } else {
        setState(() {
          _statusMessage = 'Failed to request OTP.';
        });
      }
    } else {
      setState(() {
        _statusMessage = 'Failed to add device.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                performApiCalls();
              },
              child: Text('Run API Calls'),
            ),
            SizedBox(height: 20),
            Text(
              _statusMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
