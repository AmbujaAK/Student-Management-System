import 'package:flutter/material.dart';

class FacultyDetailsUtil extends StatelessWidget {
  final List list;
  final int index;
  FacultyDetailsUtil({Key key, this.list, this.index}):super(key:key);

  @override
  Widget build(BuildContext context) {
    var card = new Card(
      child: new Column(
        children: <Widget>[

          new ListTile(
            leading: new Icon(Icons.account_box, color: Colors.red),
            title: new Text(list[index]['fname'] + " " + list[index]['lname'], style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: new Text("flutter developer"),
          ),

          new Divider(color: Colors.red, indent: 72.0,),

          new ListTile(
            leading: new Icon(Icons.email, color: Colors.red),
            title: new Text(list[index]['email'] , style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          new Divider(color: Colors.red, indent: 72.0,),

          new ListTile(
            leading: new Icon(Icons.phone, color: Colors.red),
            title: new Text(list[index]['mobile'] , style: TextStyle(fontWeight: FontWeight.bold),),
          ),

        ],
      ),
    );

    final sizedBox = new Container(
      child: SizedBox(
        height: 400.0,
        child: card,
      ),
    );

    return Container(
      child: sizedBox,      
    );
  }
}