import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/map_provider.dart';
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MapProvider()),
      ],
      child: MaterialApp(
        title: 'Uber-like App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home', // Set HomeScreen as the initial route
        routes: {
          '/home': (context) => HomeScreen(),
          '/map': (context) => MapScreen(),
          // Add other routes here
        },
      ),
    );
  }
}
