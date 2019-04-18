import 'package:flutter/material.dart';
import 'studentListItem.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../utils/constant.dart';

class StudentList extends StatefulWidget {
  final List list;
  final String title;
  StudentList({Key key, this.list, this.title}):super(key:key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  Future<List> getData() async{
    final response = await http.get(Constant.studentUrl);
    
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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