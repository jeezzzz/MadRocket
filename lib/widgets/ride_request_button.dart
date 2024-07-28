import 'package:flutter/material.dart';
import 'package:madrocket/screens/ride_request_screen.dart';

class RideRequestButton extends StatelessWidget {
  const RideRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => RideRequestScreen()),
        );
      },
      child: const Text('Request a Ride'),
    );
  }
}
