import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'facultyListItem.dart';
import '../utils/constant.dart';

class FacultyList extends StatefulWidget {
  final List list;
  final String title;
  FacultyList({Key key, this.list,this.title}):super(key:key);

  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyList> {
  Future<List> getData() async{
    final response = await http.get(Constant.facultyUrl);
    
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List>(
          future: getData(),
          builder: (context, index){
            if(index.hasError)
              print("error !!");
            if(index.hasData)
              return FacultyListItem(list :index.data);
            else
              return Center(child: CircularProgressIndicator()); 
          },
        ),
      ),
    );
  }
}