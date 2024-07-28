import 'package:madrocket/models/location.dart';

class Driver {
  final int id;
  final String name;
  final String carModel;
  final double rating;
  final Location location;

  Driver({
    required this.id,
    required this.name,
    required this.carModel,
    required this.rating,
    required this.location,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      name: json['name'],
      carModel: json['carModel'],
      rating: json['rating'],
      location: Location.fromJson(json['location']),
    );
  }
}
