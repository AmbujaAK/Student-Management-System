import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'registerApp.dart';
import '../utils/sharedPref.dart';
import '../utils/constant.dart';

class VerifyUser extends StatefulWidget {
  @override
  _VerifyUserState createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {
  TextEditingController userId = new TextEditingController();

  String message = "";
  String status = "";
  void verify() async {
    final response = await http.post(Constant.verifyUrl, body: {
      "user_id" : userId.text,
    });

    var datauser = json.decode(response.body);
    
    if(datauser['status'] == "false"){
      setState(() {
       message = datauser['message']; 
      });
    }else{
      setState(() {
      status = datauser['status'];
      message = datauser['message'];
      });
      String user = userId.text;
      saveUserId(user).then((bool committed) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => RegisterApp(userId: userId,),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final logoJU =Image.asset('assets/images/logo1.png');
    
    final logo = Hero(
      tag: 'verify',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: logoJU
      ),
    );

    final userIdApp = TextFormField(
      autofocus: false,
      controller: userId,
      decoration: InputDecoration(
        hintText: 'userId',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        )
      )
    );
    
    final verifyButton =Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade100,
        color: Colors.redAccent,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            verify();
          },
          child: Text('Verify User', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final error = Text(message, style: TextStyle(color: Colors.redAccent,));

    final loginLink = FloatingActionButton(
      child: Text('login'),
      isExtended: false,
      foregroundColor: Colors.yellow,
      backgroundColor: Colors.blueAccent,
      elevation: 5.0,
      heroTag: "reg",
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => RegisterApp(),
        ));
      },
    );

    final bottomNavBar = BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      color: Colors.redAccent,
      child: Container(height: 48.0,),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 48.0, 8.0, 48.0),
        child: Material(
          shadowColor: Colors.yellow,
          borderRadius: BorderRadius.circular(30.0),
          elevation: 5.0,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 48.0,),
                userIdApp,
                SizedBox(height: 8.0,),
                error,
                SizedBox(height: 24.0,),
                verifyButton,
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: loginLink,
      bottomNavigationBar: bottomNavBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}