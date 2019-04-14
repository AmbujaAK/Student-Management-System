import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../utils/constant.dart';

enum DismissDialogAction {
  cancel,
  discard,
  save,
}

class EditStudentProfile extends StatefulWidget {
  final List list;
  EditStudentProfile({Key key, this.list});

  @override
  EditStudentProfileState createState() => EditStudentProfileState();
}

class EditStudentProfileState extends State<EditStudentProfile> {
  bool _hasName = false;
  String _eventName;

  String message="";
  String status="";
  
  TextEditingController username ;
  TextEditingController firstname ;
  TextEditingController middlename ;
  TextEditingController lastname ;
  TextEditingController email ;
  TextEditingController mobile ;
  TextEditingController dob ;
  TextEditingController joindate ;

  void _updateData() async {
    final response = await http.post(Constant.updateStudentUrl,  body: {
      "student_id" : widget.list[0]['student_id'],
      "username" : username.text,
      "fname" : firstname.text,
      "mname" : middlename.text,
      "lname" : lastname.text,
      "email" : email.text,
      "mobile" : mobile.text,
    });

    var datauser = json.decode(response.body);
    debugPrint(datauser.toString());
    
    if(mounted){
      setState(() {
        status = datauser['status'];
        message = datauser['message'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    username = TextEditingController(text: widget.list[0]['username']);
    firstname = TextEditingController(text: widget.list[0]['fname']);
    middlename = TextEditingController(text: widget.list[0]['mname']);
    lastname = TextEditingController(text: widget.list[0]['lname']);
    email = TextEditingController(text: widget.list[0]['email']);
    mobile = TextEditingController(text: widget.list[0]['mobile']);
    joindate = TextEditingController(text: widget.list[0]['join_date']);
    dob = TextEditingController(text: widget.list[0]['dob']);
    
  }

  @override
  void dispose() {
    super.dispose();
    username = TextEditingController(text: '');
    firstname = TextEditingController(text: '');
    middlename = TextEditingController(text: '');
    lastname = TextEditingController(text: '');
    email = TextEditingController(text: '');
    mobile = TextEditingController(text: '');
    dob = TextEditingController(text: '');
    joindate = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    final userImage = NetworkImage(widget.list[0]['img_url']);
    
    final logo = Hero(
      tag: 'reg',
      child: CircleAvatar(
        radius: 55.0,
        backgroundColor: Colors.redAccent,
        child: Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: userImage,
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
      ),
    );

    final studentIdApp = TextFormField(
      autofocus: false,
      enabled: false,
      initialValue: widget.list[0]['student_id'],
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.network_locked,
            color: Colors.grey,
          ),
        ),
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

    final departmentApp = TextFormField(
      autofocus: false,
      enabled: false,
      initialValue: widget.list[0]['department_id'],
      //controller: department,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.network_locked,
            color: Colors.grey,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.class_,
            color: Colors.grey,
          ),
        ),
        labelText: 'Department ID',
        hintText: 'department',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final usernameApp = TextFormField(
      autofocus: false,
      //initialValue: username,
      controller: username,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){},
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
          ),
        ),
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
      //initialValue: firstname,
      controller: firstname,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){},
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
          ),
        ),
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
      //initialValue: middlename,
      controller: middlename,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){},
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
          ),
        ),
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
      //initialValue: lastname,
      controller: lastname,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){},
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
          ),
        ),
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
      //initialValue: email,
      controller: email,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){},
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
          ),
        ),
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
      //initialValue: mobile,
      controller: mobile,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){},
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
          ),
        ),
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

    final dobApp = TextFormField(
      autofocus: false,
      enabled: false,
      //initialValue: dob,
      controller: dob,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.network_locked,
            color: Colors.grey,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.date_range,
            color: Colors.grey,
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
      enabled: false,
      //initialValue: joindate,
      controller: joindate,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.network_locked,
            color: Colors.grey,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.date_range,
            color: Colors.grey,
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

    return Scaffold(
      appBar: AppBar(
        title: Text(_hasName ? _eventName : 'Edit Profile'),
        actions: <Widget> [
          FlatButton(
            child: Text(
              "save",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              _updateData();
              Navigator.pop(context, DismissDialogAction.save);
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 12.0, right: 12.0),
            children: <Widget>[
              logo,
              SizedBox(height: 8.0,),
              studentIdApp,
              SizedBox(height: 8.0,),
              departmentApp,
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
              joindateApp,
              SizedBox(height: 8.0,),
              dobApp,
            ],
          ),
        ),
      ),    );
  }
}
