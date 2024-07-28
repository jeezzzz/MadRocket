import 'package:flutter/material.dart';

class DriverMarker extends StatelessWidget {
  final String name;

  DriverMarker({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(4.0),
      child: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
