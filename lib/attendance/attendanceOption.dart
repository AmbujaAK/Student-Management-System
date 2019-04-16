import 'package:flutter/material.dart';
import 'takeAttendance.dart';
import 'createAttendance.dart';
import 'ViewAttendance.dart';

class AttendanceOption extends StatelessWidget {
  final String userType;
  AttendanceOption({Key key, this.userType});
  @override
  Widget build(BuildContext context) {

    Color btnColor = Colors.white;
    Color textColor = Colors.redAccent;
    Color borderColor = Colors.black12;

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
            userType == "faculty"
            ? RaisedButton(
              padding: EdgeInsets.all(12),
              highlightColor: Colors.redAccent,
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2.0,
                  color: borderColor,
                  style: BorderStyle.solid
                )
              ),
              color: btnColor,
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateAttendance(type: "create",),
                  )
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Create New Attendance Table",
                  style: TextStyle(color: textColor),
                ),
              ),
            ) :
            SizedBox(height: 4.0),
            userType == "faculty"
            ? RaisedButton(
              padding: EdgeInsets.all(12),
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2.0,
                  color: borderColor,
                  style: BorderStyle.solid
                )
              ),
              color: btnColor,
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TakeAttendance(type: "update",),
                  )
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Take Attendance",
                  style: TextStyle(color: textColor),
                ),
              ),
            ) :
            SizedBox(height: 4.0),
            RaisedButton(
              padding: EdgeInsets.all(12),
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2.0,
                  color: borderColor,
                  style: BorderStyle.solid
                )
              ),
              color: btnColor,
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewAttendance(type: "read",),
                  )
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "View Attendance",
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}