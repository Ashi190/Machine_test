import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // Replace with your actual API endpoint
  final String baseUrl = 'http://devapiv4.dealsdray.com/api/v2/user';

  // Method to add device
  Future<bool> addDevice({
    required String deviceType,
    required String deviceId,
    required String deviceName,
    required String deviceOSVersion,
    required String deviceIPAddress,
    required double lat,
    required double long,
    required String buyerGcmid,
    required String buyerPemid,
    required String appVersion,
    required String installTimeStamp,
    required String uninstallTimeStamp,
    required String downloadTimeStamp,
  }) async {
    final String url = '$baseUrl/device/add';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'deviceType': deviceType,
          'deviceId': deviceId,
          'deviceName': deviceName,
          'deviceOSVersion': deviceOSVersion,
          'deviceIPAddress': deviceIPAddress,
          'lat': lat,
          'long': long,
          'buyer_gcmid': buyerGcmid,
          'buyer_pemid': buyerPemid,
          'app': {
            'version': appVersion,
            'installTimeStamp': installTimeStamp,
            'uninstallTimeStamp': uninstallTimeStamp,
            'downloadTimeStamp': downloadTimeStamp,
          },
        }),
      );

      if (response.statusCode == 200) {
        print('Device added successfully');
        return true;
      } else {
        print('Failed to add device: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error occurred while adding device: $e');
      return false;
    }
  }

  // Method to request OTP
  Future<bool> requestOtp(String mobileNumber, String deviceId) async {
    final String url = '$baseUrl/otp';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'mobileNumber': mobileNumber,
          'deviceId': deviceId,
        }),
      );

      if (response.statusCode == 200) {
        print('OTP requested successfully');
        return true;
      } else {
        print('Failed to request OTP: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error occurred while requesting OTP: $e');
      return false;
    }
  }

  // Method to verify OTP
  Future<bool> verifyOtp(String otp, String deviceId, String userId) async {
    final String url = '$baseUrl/otp/verification';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'otp': otp,
          'deviceId': deviceId,
          'userId': userId,
        }),
      );

      if (response.statusCode == 200) {
        print('OTP verified successfully');
        return true;
      } else {
        print('Failed to verify OTP: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error occurred while verifying OTP: $e');
      return false;
    }
  }

  // Method to send email referral
  Future<bool> sendEmailReferral({
    required String email,
    required String password,
    required int referralCode,
    required String userId,
  }) async {
    final String url = '$baseUrl/email/referral';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'referralCode': referralCode,
          'userId': userId,
        }),
      );

      if (response.statusCode == 200) {
        print('Email referral sent successfully');
        return true;
      } else {
        print('Failed to send email referral: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error occurred while sending email referral: $e');
      return false;
    }
  }

  // Method to get home data without price
  Future<void> getHomeWithoutPrice() async {
    final String url = '$baseUrl/home/withoutPrice';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('Home data fetched successfully: $data');
      } else {
        print('Failed to fetch home data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching home data: $e');
    }
  }
}
