import 'package:madrocket/models/location.dart';

class User {
  final int id;
  final String name;
  final String email;
  final Location location;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.location});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      location: Location.fromJson(json['location']),
    );
  }
}
