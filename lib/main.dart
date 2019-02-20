import 'package:flutter/material.dart';
import 'splashAnimation.dart';
import './auth/passCode.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Dashboard';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PassCode(),
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
    );
  }
}