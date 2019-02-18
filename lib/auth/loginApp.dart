import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../myHome.dart';
import 'registerApp.dart';

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String status = "";
  String message = "";

  Future<List> _login() async {
    final response = await http.post("http://192.168.0.101/jusms/flutter/login.php", body: {
      "username" : username.text,
      "password" :password.text,
    });

    var datauser = json.decode(response.body);
    
    if(datauser.length == 0){
      setState(() {
       message = "login fail"; 
      });
    }else{
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => MyHomePage()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final logoJU =Image.asset('assets/images/logo1.png');
    
    final logo = Hero(
      tag: 'log',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        //child: FlutterLogo(),
        child: logoJU
      ),
    );

    final usernameApp = TextFormField(
      autofocus: false,
      initialValue: 'AmbujaAK',
      //controller: username,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        )
      )
    );
    
    final passwordApp = TextFormField(
      autofocus: false,
      initialValue: 'qwerty123',
      //controller: password,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        )
      )
    );
    
    final loginButton =Padding(
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
            _login();
          },
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text('Forget Password ?', style: TextStyle(color: Colors.black54)),
      onPressed: () {

      },
    );

    final registerLink = FloatingActionButton(
      child: Text("New"),
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
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0,),
            usernameApp,
            SizedBox(height: 8.0,),
            passwordApp,
            SizedBox(height: 24.0,),
            loginButton,
            forgotLabel,
          ],
        ),
      ),
      floatingActionButton: registerLink,
      bottomNavigationBar: bottomNavBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}