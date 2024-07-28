import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search for destinations',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          // Handle search input changes if needed
        },
      ),
    );
  }
}
