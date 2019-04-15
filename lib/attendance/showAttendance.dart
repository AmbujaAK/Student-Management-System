import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../utils/constant.dart';
import 'studentListItem.dart';

class ShowAttendance extends StatefulWidget {
  final String department;
  final String year;
  final String semester;
  final String subject;
  final String attendanceId;
  final String joinDate;
  final String type;
  
  ShowAttendance({
    Key key,
    this.department,
    this.year,
    this.semester,
    this.subject,
    this.attendanceId,
    this.joinDate,
    this.type,
  });

  @override
  _ShowAttendanceState createState() => _ShowAttendanceState();
}

class _ShowAttendanceState extends State<ShowAttendance> {
  
  List data = List();
  List _presentStudentIdRecord = List();

  Future<List> getStudentForAttendance() async{
    final response = await http.post(Constant.getStudentForAttendanceUrl, body: {
      "department" : widget.department,
      "year" : widget.year,
      "semester" : widget.semester,
      "subject" : widget.subject,
    });
    data = json.decode(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    final popButton = new PopupMenuButton(
      itemBuilder: (_) => <PopupMenuItem<String>>[
        new PopupMenuItem<String>(
          child: const Text('add'),
          value: 'add',
        )
      ],
      onSelected: (_){
        print(_presentStudentIdRecord);
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
        actions: <Widget>[
          popButton
        ],
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: getStudentForAttendance(),
          builder: (context, index){
            if(index.hasError)
              print("error !!");
            if(index.hasData)
              return StudentListItem(type: widget.type, list: index.data,presentStudentIdRecord: _presentStudentIdRecord,);
            else
              return Center(
                child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}