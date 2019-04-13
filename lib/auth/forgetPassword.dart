import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/constant.dart';
import 'dart:convert';
import 'loginApp.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
    TextEditingController userId = new TextEditingController();
    TextEditingController password1 = new TextEditingController();
    TextEditingController password2 = new TextEditingController();

    String message="";
    String status="";

  void _changePassword() async {
    final response = await http.post(Constant.changePasswordUrl, body: {
      "student_id" : userId.text,
      "password1" : password1.text,
      "password2" : password2.text,
    });

    var datauser = json.decode(response.body);
    
    if(datauser['status'] == "false"){
      print(datauser);
      setState(() {
       message = datauser['message']; 
      });
    }else{
      print(datauser);
      setState(() {
      status = datauser['status'];
      message = datauser['message'];
      });
      if(status == "true"){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => LoginApp(),
        ));
      }
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
        child: logoJU
      ),
    );

    final userIdApp = TextFormField(
      autofocus: false,
      controller: userId,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.person_pin,
            color: Colors.red,
          ),
        ),
        labelText: 'User ID',
        hintText: 'user id',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final password1App = TextFormField(
      autofocus: false,
      controller: password1,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.security,
            color: Colors.red,
          ),
        ),
        labelText: 'password',
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );
    
    final password2App = TextFormField(
      autofocus: false,
      controller: password2,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.security,
            color: Colors.red,
          ),
        ),
        labelText: 'confirm password',
        hintText: 'confirm password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final changePasswordButton =Padding(
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
            _changePassword();
          },
          child: Text('Change password', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final error = Text(message, style: TextStyle(color: Colors.redAccent,));

    final verifyLink = FloatingActionButton(
      child: Text('new'),
      isExtended: false,
      foregroundColor: Colors.yellow,
      backgroundColor: Colors.blueAccent,
      elevation: 5.0,
      heroTag: "verify",
      onPressed: (){
        Navigator
        .of(context)
        .pop(MaterialPageRoute(
          builder: (context) => LoginApp()
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
                SizedBox(height: 30.0,),
                userIdApp,
                SizedBox(height: 10.0,),
                password1App,
                SizedBox(height: 10.0,),
                password2App,
                SizedBox(height: 10.0,),
                error,
                SizedBox(height: 30.0,),
                changePasswordButton,
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: verifyLink,
      bottomNavigationBar: bottomNavBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}