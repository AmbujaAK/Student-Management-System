import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  @override
  Widget build(BuildContext context) {
    var card = new Card(
      child: new Column(
        children: <Widget>[

          new ListTile(
            leading: new Icon(Icons.account_box, color: Colors.red),
            title: new Text("Ambuj kumar", style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: new Text("flutter developer"),
          ),

          new Divider(color: Colors.red, indent: 72.0,),

          new ListTile(
            leading: new Icon(Icons.web, color: Colors.red),
            title: new Text("https://ambujaak.github.io", style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          new Divider(color: Colors.red, indent: 72.0,),

          new ListTile(
            leading: new Icon(Icons.email, color: Colors.red),
            title: new Text("itsambuja@gmail.com", style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          new Divider(color: Colors.red, indent: 72.0,),

          new ListTile(
            leading: new Icon(Icons.phone, color: Colors.red),
            title: new Text("+91-8935802059", style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          new Divider(color: Colors.red, indent: 72.0,),

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