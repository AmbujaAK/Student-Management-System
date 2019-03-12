import 'package:flutter/material.dart';
import 'splashAnimation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Dashboard';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashAnimation(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}