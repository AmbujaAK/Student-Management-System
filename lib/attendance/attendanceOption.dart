import 'package:flutter/material.dart';
import 'takeAttendance.dart';
import 'createAttendance.dart';
import 'ViewAttendance.dart';

class AttendanceOption extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Board'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2.0,
                  color: Colors.redAccent,
                  style: BorderStyle.solid
                )
              ),
              color: Colors.white,
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateAttendance(type: "create",),
                  )
                );
              },
              child: Text("Create New Attendance Table"),
            ),
            RaisedButton(
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2.0,
                  color: Colors.redAccent,
                  style: BorderStyle.solid
                )
              ),
              color: Colors.white,
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TakeAttendance(type: "update",),
                  )
                );
              },
              child: Text("Take Attendance"),
            ),
            RaisedButton(
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2.0,
                  color: Colors.redAccent,
                  style: BorderStyle.solid
                )
              ),
              color: Colors.white,
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewAttendance(type: "read",),
                  )
                );
              },
              child: Text("View Attendance"),
            ),
          ],
        ),
      ),
    );
  }
}