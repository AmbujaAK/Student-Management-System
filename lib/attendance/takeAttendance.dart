import 'package:flutter/material.dart';

class TakeAttendance extends StatefulWidget {
  @override
  _TakeAttendanceState createState() => _TakeAttendanceState();
}

class _TakeAttendanceState extends State<TakeAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Name"),
      ),
          body: Container(
        color: Colors.red[100],
      ),
    );
  }
}