import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../utils/constant.dart';
import 'studentListItem.dart';

class UpdateAttendance extends StatefulWidget {
  final String department;
  final String year;
  final String semester;
  final String subject;
  final String type;
  UpdateAttendance({
    Key key,
    this.department,
    this.year,
    this.semester,
    this.subject,
    this.type,
  });

  @override
  _UpdateAttendanceState createState() => _UpdateAttendanceState();
}

class _UpdateAttendanceState extends State<UpdateAttendance> {
  
  List data = List();
  List _presentStudentIdRecord = List();

  Future<List> getStudentForAttendance() async{
    final response = await http.post(Constant.getStudentForAttendanceUrl, body: {
      "department" : widget.department,
      "year" : widget.year,
      "semester" : widget.semester,
      "subject" : widget.subject
    });
    data = json.decode(response.body);
    return json.decode(response.body);
  }

  Map map;
  _takeAttendance() async {
    int len = _presentStudentIdRecord.length;
    
    for(int i=0; i<len; i++){
      final res = await http.post(Constant.takeAttendanceOnAvailableUrl,body: {
        "department" : widget.department,
        "year" : widget.year,
        "semester" : widget.semester,
        "subject" : widget.subject,
        "present_student_id" : _presentStudentIdRecord[i]
      });
      map = json.decode(res.body);
    }
    print(map);
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
        _takeAttendance();
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