import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constant.dart';
import 'studentListItem.dart';

class TakeAttendance extends StatefulWidget {
  final String department;
  final String year;
  final String semester;
  final String subject;
  
  TakeAttendance({Key key,this.department,this.year,this.semester,this.subject});

  @override
  _TakeAttendanceState createState() => _TakeAttendanceState();
}

class _TakeAttendanceState extends State<TakeAttendance> {
  String attendance_id;
  String subject_id;
  Future<List> getData() async{
    final response = await http.get(Constant.studentUrl);
    
    return json.decode(response.body);
  }

  _getAttendanceSheet() async {
    final res = await http.post(Constant.getAttendanceSheet1,body:{
      "department" : widget.department,
      "year" : widget.year,
      "semester" : widget.semester,
      "subject" : widget.subject
    });
    var sheet = json.decode(res.body);
    print(sheet[0]);
    attendance_id = sheet[0]['attendance_id'];
    subject_id = sheet[0]['subject_id'];

    print(attendance_id);
    print(subject_id);
  }

  @override
  void initState() {
    super.initState();
    _getAttendanceSheet();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('take attendance'),
      ),
      body: FutureBuilder<List>(
                future: getData(),
                builder: (context, index){
                  if(index.hasError)
                    print("error !!");
                  if(index.hasData)
                    return StudentListItem(list :index.data);
                  else
                    return Center(child: CircularProgressIndicator()); 
                },
              ),
    );
  }
}