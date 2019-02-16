import 'package:flutter/material.dart';
import 'TimeTableCard.dart';
import 'notification.dart';
import 'progress.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TimeTableCard(),
          NotificationCard(),
          ProgressCard(),
        ],
      ),
    );
  }
}