import 'package:flutter/material.dart';
import 'dialogButton.dart';
import '../utils/constant.dart';

class Attendance1 extends StatefulWidget {
  @override
  _Attendance1State createState() => _Attendance1State();
}

class _Attendance1State extends State<Attendance1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendace'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DialogButton(btnName: "Department",url: Constant.facultyUrl,),
            SizedBox(height: 8.0,),

            DialogButton(btnName: "Year",url: Constant.studentUrl,),

            SizedBox(height: 8.0,),

            DialogButton(btnName: "Semester",url: Constant.facultyUrl,),

            SizedBox(height: 8.0,),

            DialogButton(btnName: "Department",url: Constant.facultyUrl,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        isExtended: true,
        tooltip: 'take attendance',
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}