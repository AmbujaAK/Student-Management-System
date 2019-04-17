import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constant.dart';
import 'announcementItem.dart';
import 'announcementForm.dart';

class Announcement extends StatefulWidget {
  final String userType;
  final List user;
  Announcement({Key key, this.userType,this.user});

  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  Future<List>_loadAnnouncement() async {
    final response = await http.get(Constant.getAnnouncementUrl);

    return json.decode(response.body) as List;
  }

  @override
  Widget build(BuildContext context) {
    print('user :: ');
    print(widget.user);
    Widget fab = FloatingActionButton(
      child: Icon(Icons.add,color: Colors.yellowAccent,),
      onPressed: (){

        Navigator
        .of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => AnnouncementForm(user: widget.user),
          )
        );
      
      },
      backgroundColor: Colors.redAccent,
      elevation: 3.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Announcement"),
      ),
      body: Container(
        color: Color(0xffdfd4f4),
        child: FutureBuilder<List>(
          future: _loadAnnouncement(),
          builder: (context, index){
            if(index.hasError)
              print('error !!');
            if(index.hasData)
              return AnnouncementItem(list: index.data);
            else
              return Center(child: CircularProgressIndicator());
          },
        )
      ),
      floatingActionButton: widget.userType == "faculty" ? fab : Text('')
    );
  }
}