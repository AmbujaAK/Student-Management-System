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
        primaryColor: Colors.redAccent,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            )
          ),
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
      ),
    );
  }
}