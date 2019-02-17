import 'package:flutter/material.dart';
import 'studentListItem.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class StudentList extends StatefulWidget {
  final List list;

  StudentList({Key key, this.list}):super(key:key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  Future<List> getData() async{
    final response = await http.get("http://192.168.0.104/jusms/flutter/getStudent.php");
    
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
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