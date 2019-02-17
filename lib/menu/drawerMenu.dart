import 'package:flutter/material.dart';
import '../student/studentList.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                width: 100,
                color: Colors.green,
              ),
              Container(
                height: 150,
                width: 150,
                color: Colors.yellow,
              ),
            ],
          ),

          decoration: BoxDecoration(
            color: Colors.redAccent
          ),
        ),

        Card(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment(-1, 0),
                child: Text("My Recent Activities"),
              ),
              Container(
                height: 150,
                color: Colors.black,
              )
            ],
          ),
        ),

        new Divider(color: Colors.redAccent, indent: 12.0,),

        ListTile(
          leading: Icon(Icons.dashboard),
          title: Text('My Account'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Students'),
          onTap: () {
            //Navigator.pop(context);
            Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StudentList(),
              )
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text('Faculty'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notifications'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.pop(context);
          },
        ),

        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
          onTap: () {
            Navigator.pop(context);
          },
        ),

        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ButtonTheme(
            minWidth: 150,
            height: 48,
            child: RaisedButton(
              color: Colors.red,
              child: Text("Log Out"),
              onPressed: (){
                //Navigator.of(context).push(
                //MaterialPageRoute(builder: (context) => MyCustomForm())
                //);
              },
            ),
          ),
        )
      ],
    );
  }
}