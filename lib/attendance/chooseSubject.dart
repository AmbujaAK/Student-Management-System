import 'package:flutter/material.dart';
import '../utils/constant.dart';
import 'updateAttendance.dart';
import 'getSubject.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'attendanceOption.dart';
import 'showAttendance.dart';

class ChooseSubject extends StatefulWidget {
  final String department;
  final String year;
  final String semester;
  final String subject;
  final String attendanceId;
  final String joinDate;
  final String type;
  ChooseSubject({
    Key key,
    this.department,
    this.year,
    this.semester,
    this.subject,
    this.attendanceId,
    this.joinDate,
    this.type
  });

  @override
  _ChooseSubjectState createState() => _ChooseSubjectState();
}

class _ChooseSubjectState extends State<ChooseSubject> {
  TextEditingController subject = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.department);
    print(widget.year);
    print(widget.semester);
    print(widget.attendanceId);
    print(widget.joinDate);
  }  
  @override
  Widget build(BuildContext context) {

    String _getLable(){
      if(widget.type == "create"){
        return "Create Attendance Table";
      }else if(widget.type == "read"){
        return "View Attendance";
      }else if(widget.type == "update"){
        return "Update Attendance";
      }else{
        return "Button";
      }
    }

    Map data;
    _createAttendanceTable() async {
      final res = await http.post(Constant.createAttendanceUrl,body: {
        "department" : widget.department,
        "year" : widget.year,
        "semester" : widget.semester,
        "attendance_id" : widget.attendanceId,
        "join_date" : widget.joinDate,
        "subject" : subject.text
      });
      data = json.decode(res.body);
      print(data);
      print(data['status']);
      if(data['status'] == "true"){
        Navigator
        .of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => AttendanceOption()
          )
        );
      }
    }
    void _onPressedButton(){
      if(widget.type == "create"){
        _createAttendanceTable();
      }else if(widget.type == "read"){
        Navigator
        .of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => ShowAttendance(
              department: widget.department,
              year: widget.year,
              semester: widget.semester,
              attendanceId: widget.attendanceId,
              joinDate: widget.joinDate,
              subject: subject.text,
              type: widget.type,
            )
          )
        );
      }else if(widget.type == "update"){
        Navigator
        .of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => UpdateAttendance(
              department: widget.department,
              year: widget.year,
              semester: widget.semester,
              subject: subject.text,
              type: widget.type,
            )
          )
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Subject'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 8.0,),
            GetSubjects(
              icon: Icon(Icons.book, color: Colors.redAccent,), 
              boxName: "subject", 
              input: subject,
              url: Constant.getSubjects,
              department: widget.department,
              year: widget.year,
              semester: widget.semester,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        icon: Icon(Icons.add_circle_outline,color: Colors.yellowAccent),
        label: Text(
          _getLable(),
          style: TextStyle(color: Colors.yellowAccent)
        ),
        isExtended: true,
        onPressed: (){
          print(widget.department);
          print(widget.year);
          print(widget.semester);
          print(subject.text);
          _onPressedButton();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}