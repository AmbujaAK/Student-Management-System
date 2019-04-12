import 'package:flutter/material.dart';
import '../utils/sharedPref.dart';
import '../auth/loginApp.dart';

class PopUpMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      var logoutBtn = Padding(
      padding: const EdgeInsets.all(14.0),
      child: InkWell(
        child: Text(
          "Log Out",
        ),
        onTap: (){
          clearPref();
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LoginApp()),
          );
        },
      ),
    );

    return new PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: logoutBtn,
        ),
      ],
    );
  }
}