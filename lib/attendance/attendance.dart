import 'package:flutter/material.dart';
import 'dropdown.dart';
import 'takeAttendance.dart';

class Attendance extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              /* Horizontal row */
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DropDown(),
                    DropDown(),
                    DropDown()
                  ],
                ),
              ),
            ),

            SizedBox(height: 60.0,),
            Container(
              height: 400,
              width: 400,
              child: Center(
                child: Container(
                  alignment: Alignment(0, 0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.yellowAccent,
                    shadowColor: Colors.redAccent,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      child: Text(
                        "Take Attendance"
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => TakeAttendance(),
                        ));
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}