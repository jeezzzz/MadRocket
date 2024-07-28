import 'package:madrocket/models/driver.dart';

class FakeBackend {
  Future<List<Driver>>? get dummyDrivers => null;

  Future<Future<List<Driver>>?> fetchDrivers() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return dummyDrivers;
  }
}
