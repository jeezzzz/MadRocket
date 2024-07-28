import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/driver.dart';
import '../models/location.dart';

class MapProvider with ChangeNotifier {
  Location? currentLocation; // Ensure this matches the type used in MapLibreMap
  List<Driver> drivers = [];

  final String _apiKey = 'mYUer5kfYh1mxVxM6dJ73L7lQbFjEIMCHds9vANS';
  final String _autocompleteUrl =
      'https://api.olamaps.io/places/v1/autocomplete';
  final String _driversDataUrl =
      'https://api.example.com/drivers'; // Replace with actual endpoint
  final String _userDataUrl =
      'https://api.example.com/user'; // Replace with actual endpoint

  Future<void> fetchCurrentUser() async {
    final response = await http.get(Uri.parse(_userDataUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      currentLocation = Location.fromJson(data['location']);
      notifyListeners();
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<List<String>> fetchAutocompleteSuggestions(String query) async {
    final response = await http.get(
      Uri.parse('$_autocompleteUrl?input=$query&api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<String>.from(data['suggestions'].map((s) => s['name']));
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  Future<void> fetchDrivers() async {
    final response = await http.get(Uri.parse(_driversDataUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      drivers = (data as List).map((d) => Driver.fromJson(d)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load drivers');
    }
  }
}
