import 'package:flutter/material.dart';

import './nav/bottomNavigation.dart';
class MyHomePage extends StatefulWidget {
  final String userId;
  MyHomePage({Key key,this.userId});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //return Tabs(userId: widget.userId,);
    return BottomNavigation(userId: widget.userId);
  }
}