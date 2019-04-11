import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../myHome.dart';
import 'loginApp.dart';

class RegisterApp extends StatefulWidget {
  final TextEditingController userId;
  RegisterApp({Key key, this.userId});

  @override
  _RegisterAppState createState() => _RegisterAppState();
}

class _RegisterAppState extends State<RegisterApp> {
  TextEditingController studentId = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController firstname = new TextEditingController();
  TextEditingController middlename = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController joindate = new TextEditingController();
  TextEditingController imgUrl = new TextEditingController();
  TextEditingController githubLink = new TextEditingController();
  TextEditingController linkedinLink = new TextEditingController();
  TextEditingController websiteLink = new TextEditingController();

  String status = "";
  String message = "";

  Future _register() async {
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

    final studentIdApp = TextFormField(
      autofocus: false,
      enabled: false,
      //initialValue: '001511001074',
      controller: widget.userId,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.security,
            color: Colors.grey,
          ),
        ),
        labelText: 'Student Id',
        hintText: 'Student Id',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
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
            color: Colors.red,
          ),
        ),
        labelText: 'Username',
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final firstnameApp = TextFormField(
      autofocus: false,
      //initialValue: 'Ambuj',
      controller: firstname,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.text_fields,
            color: Colors.red,
          ),
        ),
        labelText: 'First name',
        hintText: 'First name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final middlenameApp = TextFormField(
      autofocus: false,
      //initialValue: '',
      controller: middlename,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.text_fields,
            color: Colors.red,
          ),
        ),
        labelText: 'Middle name',
        hintText: 'Middle name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final lastnameApp = TextFormField(
      autofocus: false,
      //initialValue: 'Kumar',
      controller: lastname,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.text_fields,
            color: Colors.red,
          ),
        ),
        labelText: 'Last name',
        hintText: 'Last name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final emailApp = TextFormField(
      autofocus: false,
      //initialValue: 'itsambuja@gmail.com',
      controller: email,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.mail,
            color: Colors.red,
          ),
        ),
        labelText: 'email',
        hintText: 'email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final mobileApp = TextFormField(
      autofocus: false,
      //initialValue: '8935802059',
      controller: mobile,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.phone,
            color: Colors.red,
          ),
        ),
        labelText: 'mobile',
        hintText: 'mobile',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
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

    final dobApp = TextFormField(
      autofocus: false,
      //initialValue: '04/01/1997',
      controller: dob,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.date_range,
            color: Colors.red,
          ),
        ),
        labelText: 'D.O.B',
        hintText: 'D.O.B',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final joindateApp = TextFormField(
      autofocus: false,
      //initialValue: '17/08/2015',
      controller: username,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.date_range,
            color: Colors.red,
          ),
        ),
        labelText: 'Join Date',
        hintText: 'Join Date',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final imgUrlApp = TextFormField(
      autofocus: false,
      //initialValue: '',
      controller: imgUrl,
      decoration: InputDecoration(
        hintText: 'Image',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        )
      )
    );

    final githubLinkApp = TextFormField(
      autofocus: false,
      //initialValue: '',
      controller: githubLink,
      decoration: InputDecoration(
        hintText: 'github link',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        )
      )
    );

    final linkedinLinkApp = TextFormField(
      autofocus: false,
      //initialValue: '',
      controller: linkedinLink,
      decoration: InputDecoration(
        hintText: 'linkedin link',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        )
      )
    );

    final websiteLinkApp = TextFormField(
      autofocus: false,
      //initialValue: '',
      controller: websiteLink,
      decoration: InputDecoration(
        hintText: 'website link',
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
                SizedBox(height: 24.0,),
                logo,
                SizedBox(height: 48.0,),
                studentIdApp,
                SizedBox(height: 8.0,),
                usernameApp,
                SizedBox(height: 8.0,),
                firstnameApp,
                SizedBox(height: 8.0,),
                middlenameApp,
                SizedBox(height: 8.0,),
                lastnameApp,
                SizedBox(height: 8.0,),
                emailApp,
                SizedBox(height: 8.0,),
                mobileApp,
                SizedBox(height: 8.0,),
                passwordApp,
                SizedBox(height: 8.0,),
                joindateApp,
                SizedBox(height: 8.0,),

                SizedBox(height: 24.0,),
                registerButton,

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: loginLink,
    );
  }
}