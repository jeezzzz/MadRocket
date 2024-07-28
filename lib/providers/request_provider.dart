import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/driver.dart';

class RequestProvider with ChangeNotifier {
  final String _apiKey = 'YOUR_API_KEY';
  final String _rideRequestUrl =
      'https://api.example.com/request-ride'; // Replace with actual endpoint

  Future<void> requestRide(Driver driver) async {
    final response = await http.post(
      Uri.parse(_rideRequestUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: json.encode({
        'driver_id': driver.id,
        'user_id': 1, // Assuming a static user ID for this example
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Handle the response as needed
      print('Ride requested successfully: ${data['ride_id']}');
    } else {
      throw Exception('Failed to request ride');
    }
  }
}
