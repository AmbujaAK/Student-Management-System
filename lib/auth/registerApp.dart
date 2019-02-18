import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../myHome.dart';
import 'loginApp.dart';

class RegisterApp extends StatefulWidget {
  @override
  _RegisterAppState createState() => _RegisterAppState();
}

class _RegisterAppState extends State<RegisterApp> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String status = "";
  String message = "";

  Future<List> _register() async {
    final response = await http.post("http://192.168.0.101/jusms/flutter/register.php", body: {
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
      tag: 'reg',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        //child: FlutterLogo(),
        child: logoJU
      ),
    );

    final usernameApp = TextFormField(
      autofocus: false,
      //initialValue: 'AmbujaAK',
      controller: username,
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
      //initialValue: 'qwerty123',
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        )
      )
    );
    
    final registerButton =Padding(
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
            _register();
          },
          child: Text('Register', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final loginLink = FloatingActionButton(
      child: Text("login"),
      isExtended: false,
      foregroundColor: Colors.yellowAccent,
      backgroundColor: Colors.blueAccent,
      elevation: 5.0,
      heroTag: "log",
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => LoginApp(),
        ));
      },
    );

    final bottomNavBar = BottomAppBar(
      color: Colors.redAccent,
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
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
            registerButton,
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: loginLink,
    );
  }
}