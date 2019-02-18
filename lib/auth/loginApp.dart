import 'package:flutter/material.dart';

import '../myHome.dart';
import 'registerApp.dart';
import '../utils/sharedPref.dart';

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  void login() {
    String userId = username.text;
    saveUserId(userId).then((bool committed) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => MyHomePage(userId: userId),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final logoJU =Image.asset('assets/images/logo1.png');
    
    final logo = Hero(
      tag: 'log',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
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
            login();
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
      child: Text('new'),
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 48.0, 8.0, 48.0),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          elevation: 5.0,
          child: Center(
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
        ),
      ),
      floatingActionButton: registerLink,
      bottomNavigationBar: bottomNavBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}