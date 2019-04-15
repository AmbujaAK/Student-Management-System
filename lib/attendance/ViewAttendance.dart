import 'package:flutter/material.dart';
import 'dialogButton.dart';
import '../utils/constant.dart';
import 'getDepartment.dart';
import 'chooseSubject.dart';
import 'simpleInputBox.dart';

class ViewAttendance extends StatefulWidget {
  final String type;
  final String department;
  final String year;
  final String semester;
  final String subject;
  
  ViewAttendance({Key key,this.type,this.department,this.year,this.semester,this.subject});

  @override
  _ViewAttendanceState createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  TextEditingController department = new TextEditingController();
  TextEditingController year = new TextEditingController();
  TextEditingController semester = new TextEditingController();
  TextEditingController attendanceId = new TextEditingController();
  TextEditingController joinDate = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('View Attendance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GetDepartment(icon: Icon(Icons.book, color: Colors.redAccent,), boxName: "department", input: department, url: Constant.departmentUrl),
            SizedBox(height: 8.0,),
            DialogButton(icon: Icon(Icons.book, color: Colors.redAccent,), boxName: "year", input: year,url: Constant.getYear),
            SizedBox(height: 8.0,),
            DialogButton(icon: Icon(Icons.book, color: Colors.redAccent,), boxName: "semester", input: semester,url: Constant.getSemester),
            SizedBox(height: 8.0,),
            SimpleInputBox(icon: Icon(Icons.book, color: Colors.redAccent,), boxName: "Attendance ID", input: attendanceId),
            SizedBox(height: 8.0,),
            SimpleInputBox(icon: Icon(Icons.book, color: Colors.redAccent,), boxName: "join Date", input: joinDate)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        label: Text('Choose Subject',style: TextStyle(color: Colors.yellowAccent)),
        icon: Icon(Icons.search,color: Colors.yellowAccent),
        isExtended: true,
        onPressed: (){
          Navigator
          .of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => ChooseSubject(
                type: widget.type,
                department: department.text,
                year: year.text,
                semester: semester.text,
                attendanceId: attendanceId.text,
                joinDate: joinDate.text,
              ),
            )
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}