import 'package:flutter/material.dart';
import 'takeAttendance.dart';
import 'pickBatch.dart';

class Attendance1 extends StatefulWidget {
  @override
  _Attendance1State createState() => _Attendance1State();
}

class _Attendance1State extends State<Attendance1> {
  DateTime _dateTime;
  int _semester;

  @override
  void initState() {
    super.initState();
    _semester = 1;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance1"),
      ),
      body: Center(
        child: Column(
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new ListTile(
                      leading: new Icon(Icons.today, color: Colors.grey[500]),
                      title: new PickBatch(
                        semester: _semester,
                        dateTime: _dateTime,
                        onChanged: (dateTime) => setState(() => _dateTime = dateTime),
                        onSemChanged: (semester) => setState(() => _semester=semester),
                      ),
                    ),
                  ),
                ],
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
                        "Take Attendance1"
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => TakeAttendance1(semester: _semester,),
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