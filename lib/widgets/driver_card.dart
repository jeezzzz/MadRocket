import 'package:flutter/material.dart';
import '../models/driver.dart';

class DriverCard extends StatelessWidget {
  final Driver driver;

  const DriverCard({required this.driver});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.directions_car),
        title: Text(driver.name),
        subtitle: Text('${driver.carModel} - Rating: ${driver.rating}'),
        trailing: Text(
            '${driver.location.latitude.toStringAsFixed(6)}, ${driver.location.longitude.toStringAsFixed(6)}'),
      ),
    );
  }
}
