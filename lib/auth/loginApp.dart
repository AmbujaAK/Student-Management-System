import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../myHome.dart';
import '../utils/sharedPref.dart';
import '../utils/constant.dart';
import 'verifyUser.dart';
import 'forgetPassword.dart';

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String message = "";
  String status = "";
  List<DropdownMenuItem<String>> userOption = [];
  String selectedItem = null;

  @override
  void initState() {
    super.initState();
    loadUserType();
  }
  void login() async {
    final response = await http.post(Constant.loginUrl, body: {
      "username" : username.text,
      "password" : password.text,
      "userType" : selectedItem,
    });
    debugPrint(selectedItem);
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
      String userId = username.text;
      String userType = selectedItem;
      saveUserId(userType,userId,status).then((bool committed) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => MyHomePage(userType: userType, userId: userId),
        ));
      });
    }
  }

  void loadUserType(){
    userOption = [];
    userOption.add(new DropdownMenuItem(
      child: new Text("As a student"),
      value: "students",
    ));
    userOption.add(new DropdownMenuItem(
      child: new Text("As a faculty"),
      value: "faculty",
    ));
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

    final userType = Container(
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 15
            ),
            isExpanded: false,
            iconSize: 0,
            items: userOption,
            value: selectedItem,
            hint: new Text('select user type'),
            onChanged: (value) {
              print('selected : $value');
              setState(() {
                selectedItem = value;
              });
            },
          ),
        ),
      ),
    );

    final usernameApp = TextFormField(
      autofocus: false,
      //initialValue: 'AmbujaAK',
      controller: username,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.person,
            color:  Colors.red,
          ),
        ),
        labelText: 'username',
        hintText: 'username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      )
    );
    
    final passwordApp = TextFormField(
      autofocus: false,
      //initialValue: 'qwerty123',
      controller: password,
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

    final error = Text(message, style: TextStyle(color: Colors.redAccent,));

    final forgotLabel = FlatButton(
      child: Text('Forget Password ?', style: TextStyle(color: Colors.black54)),
      onPressed: () {
        Navigator
        .of(context)
        .push(MaterialPageRoute(
          builder: (context) => ForgetPassword()
        ));
      },
    );

    final verifyLink = FloatingActionButton(
      child: Text('new'),
      isExtended: false,
      foregroundColor: Colors.yellow,
      backgroundColor: Colors.blueAccent,
      elevation: 5.0,
      heroTag: "verify",
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => VerifyUser(),
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
                SizedBox(height: 18.0,),
                logo,
                SizedBox(height: 38.0,),
                userType,
                SizedBox(height: 8.0,),
                usernameApp,
                SizedBox(height: 8.0,),
                passwordApp,
                SizedBox(height: 4.0,),
                error,
                SizedBox(height: 24.0,),
                loginButton,
                forgotLabel,
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