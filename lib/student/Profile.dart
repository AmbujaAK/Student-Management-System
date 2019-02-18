import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final List list;
  final int index;
  Profile({Key key, this.list, this.index});

  @override
  Widget build(BuildContext context) {
    
    final card = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
    
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Welcome " + "${this.list[this.index]['fname']}",
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final text = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Roll No :: " + list[index]['student_id'],
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[
          card,
          welcome,
          text,
        ],
      ),
    );
    return Scaffold(
      body: body,
    );
  }
}