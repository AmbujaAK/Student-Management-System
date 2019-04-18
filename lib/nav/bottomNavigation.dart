import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../menu/popUpMenu.dart';
import '../menu/drawerMenu.dart';
import '../utils/sharedPref.dart';
import '../utils/constant.dart';
import '../nav/fab_bottom_app_bar.dart';
import '../attendance/calendar.dart';
import '../FrontWidget/Dashboard.dart';
import '../faculty/facultyList.dart';
import '../student/studentList.dart';
import '../project/projectPage.dart';
class BottomNavigation extends StatefulWidget {
  final String userId;
  final String userType;
  BottomNavigation({
    Key key,
    this.userId,
    this.userType,
  });

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with TickerProviderStateMixin {

  List list = List();
  var isLoading =true;
  int tabIndex;
  
  _fetchData() async {
    setState(() {
     isLoading =true;
    });
    String url = Constant(widget.userType, widget.userId).loggedInUserUrl;
    final response = await http.get(url);

    if(response.statusCode == 200){
      list = json.decode(response.body) as List;
      setState(() {
       isLoading =false;
      });
      print(list);
    } else {
      throw Exception('failed to load user data');
    }
  }

  String name = "";
  String user = "";
  @override
  void initState() {
    print(list);
      tabIndex = 0;
    getUserId().then(updateUserId);
    getUserType().then(updateUserType);
    _fetchData();
    super.initState();
  }

  void updateUserId(String usename){
    setState(() {
     name = usename;
     print(name);
    });
  }
  void updateUserType(String userType){
    setState(() {
     user = userType;
     print(user);
    });
  }

  void _selectedTab(int index) {
    if(index < 4){
      setState(() {
        tabIndex =index;
      });
    }
  }
  Widget _getTitile(){
    if(tabIndex == 1)
      return Text('Student');
    else if(tabIndex == 2)
      return Text('Faculty');
    else if (tabIndex == 3)
      return Text('Project');
    else
      return Text('Dashboard');
  }
  @override
  Widget build(BuildContext context) {

  List<Widget> tabs = [
    Dashboard(),
    StudentList(),
    FacultyList(),
    ProjectPage()
  ];
  var centerItemText;
  var toolTip;

  if( list.length == 1){
    centerItemText = list[0]['fname'][0] + ' ' +list[0]['lname'][0];
    toolTip = list[0]['fname'] + ' ' +list[0]['lname'];
    setState(() {
     isLoading=false; 
    });
  } else{
    setState(() {
     isLoading=true; 
    });
  }

  return Scaffold(
      appBar: AppBar(
        title: _getTitile(),
        actions: <Widget>[
          PopUpMenu(),
        ],
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: isLoading ?
        Center(child: CircularProgressIndicator()) :
        Center(
          child: tabIndex == null ? tabs[0] : tabs[tabIndex],
        ),
      
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: centerItemText,
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'Students'),
          FABBottomAppBarItem(iconData: Icons.person_outline, text: 'Faculty'),
          FABBottomAppBarItem(iconData: Icons.work, text: 'Project'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.redAccent,
        //isExtended: true,
        mini: false,
        elevation: 4,
        tooltip: toolTip,
        child: Text(Calender().getTime()),
      ),
      drawer: Drawer(
        child: isLoading
        ? Center(child: CircularProgressIndicator())
        : DrawerMenu(list:list,userType: widget.userType,),
      ),
    );
  }
}