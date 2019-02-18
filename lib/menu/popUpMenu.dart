import 'package:flutter/material.dart';
import '../auth/loginApp.dart';

class PopUpMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: RaisedButton(
            child: Text("logout"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => LoginApp(),
              ));
            },
          )
        ),
        PopupMenuItem(
          child: Text('menu 2'),
        ),
        PopupMenuItem(
          child: Text('menu 3'),
        ),
      ],
    );
  }
}