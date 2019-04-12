import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'loginApp.dart';
import '../utils/constant.dart';

class RegisterApp extends StatefulWidget {
  final TextEditingController userId;
  RegisterApp({Key key, this.userId});

  @override
  _RegisterAppState createState() => _RegisterAppState();
}

class _RegisterAppState extends State<RegisterApp> {
  TextEditingController studentId = new TextEditingController();
  TextEditingController department = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController firstname = new TextEditingController();
  TextEditingController middlename = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController joindate = new TextEditingController();

  String status = "";
  String message = "";

  @override
  void initState() {
    super.initState();
    studentId = widget.userId;
  }

  DateTime _initialDate = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async{
    final DateTime datePicked = await showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: new DateTime(2000),
      lastDate: new DateTime(2100),
    );

    if(datePicked != null && datePicked != _initialDate){
      setState(() {
       _initialDate = datePicked;
       dob.text = datePicked.toString().substring(0,10);
      });
      print('Date selected :: ${dob.text}');
    }
  }

  Future<Null> _selectjoinDate(BuildContext context) async{
    final DateTime datePicked = await showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: new DateTime(2000),
      lastDate: new DateTime(2100),
    );

    if(datePicked != null && datePicked != _initialDate){
      setState(() {
 //      _initialDate = datePicked;
       joindate.text = datePicked.toString().substring(0,4);
      });
      print('Date selected :: ${dob.text}');
    }
  }

  _selectDepartment(BuildContext context,String url){
    Future<List> getData() async{
      final response = await http.get(url);
      
      return json.decode(response.body);
    }
    showDialog(
      context: context,
      builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Container(
            height: 350.0,
            width: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: FutureBuilder<List>(
              future: getData(),
              builder: (context, index){
                if(index.hasError)
                  print("error !!");
                if(index.hasData)
                  return DialogItem(list :index.data,depart: department,);
                else
                  return Center(child: CircularProgressIndicator()); 
              },
            ),
          ),
        );
      }
    );
  }
  void _register() async {
    final response = await http.post(Constant.registerUrl,  body: {
      "student_id" : studentId.text,
      "department" : department.text,
      "username" : username.text,
      "fname" : firstname.text,
      "mname" : middlename.text,
      "lname" : lastname.text,
      "email" : email.text,
      "mobile" : mobile.text,
      "dob" : dob.text,
      "join_year" : joindate.text,
      "password" :password.text,
      "confirm_password" : confirmPassword.text,
    });

    //debugPrint(response.body);
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
      controller: studentId,
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
      //initialValue: 'AmbujaAK',
      controller: department,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              _selectDepartment(context, Constant.departmentUrl);
            },
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.class_,
            color: Colors.red,
          ),
        ),
        labelText: 'department',
        hintText: 'department',
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

    final confirmPasswordApp = TextFormField(
      autofocus: false,
      //initialValue: 'qwerty123',
      controller: confirmPassword,
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
        hintText: 'confirm Password',
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
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              _selectDate(context);
            },
            child: Icon(
              Icons.date_range,
              color: Colors.grey,
            ),
          ),
        ),
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
      controller: joindate,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              _selectjoinDate(context);
            },
            child: Icon(
              Icons.date_range,
              color: Colors.grey,
            ),
          ),
        ),
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


    final error = Text(message, style: TextStyle(color: Colors.redAccent,));
    
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
                SizedBox(height: 8.0,),
                passwordApp,
                SizedBox(height: 8.0,),
                confirmPasswordApp,
                SizedBox(height: 8.0,),
                error,

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

class DialogItem extends StatefulWidget {
  final List list;
  final TextEditingController depart;
  DialogItem({Key key, this.list,this.depart}):super(key:key);

  @override
  _DialogItemState createState() => _DialogItemState();
}

class _DialogItemState extends State<DialogItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list==null ? 0 : widget.list.length,
      itemBuilder: (context, index){
        return ListTile(
          title: InkWell(
            onTap: (){
              setState(() {
                widget.depart.text = widget.list[index]['dname'];
              });
              Navigator.pop(context);
            },
            child: Text(widget.list[index]['dname'])
          ),
        );
      },
    );
  }
}
