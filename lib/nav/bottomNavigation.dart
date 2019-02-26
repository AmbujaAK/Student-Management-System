import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../menu/popUpMenu.dart';
import '../menu/drawerMenu.dart';
import '../utils/sharedPref.dart';
import '../utils/constant.dart';
import '../nav/fab_bottom_app_bar.dart';
import '../attendance/calendar.dart';
import 'home1.dart';
import '../student/Profile.dart';

class BottomNavigation extends StatefulWidget {
  final String userId;
  BottomNavigation({Key key,this.userId});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with TickerProviderStateMixin {

  List list = List();
  var isLoading =true;
  int tabIndex = 0;  
  
  _fetchData() async {
    setState(() {
     isLoading =true;
    });

    final response = await http.get(Constant.studentUrl);

    if(response.statusCode == 200){
      list = json.decode(response.body) as List;
      setState(() {
       isLoading =false;
      });
    } else {
      throw Exception('failed to load user data');
    }
  }

  String name = "";
  @override
  void initState() {
    tabIndex = 0;
    getUserId().then(updateUserId);
    _fetchData();
    super.initState();
  }

  void updateUserId(String usename){
    setState(() {
     name = usename;
    });
  }

  int _getIndex(List list){
    int index = 0;
    for(var i =0; i<list.length; i++){
      if(list[i]['username'] == name){
        index = i;
        break;
      }
    }
    return index;
  }

  void _selectedTab(int index) {
    setState(() {
      tabIndex =index;
    });
  }

  @override
  Widget build(BuildContext context) {

  List<Widget> tabs = [
    Calender(),
    Home1(name: "Ambuja",),
    Home1(name: "Aashish",),
    Profile(list: list, index: _getIndex(list),),
  ];

  return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: <Widget>[
          PopUpMenu(),
        ],
      ),
      body: isLoading ?
        Center(child: CircularProgressIndicator()) :
        Center(
          child: tabs[tabIndex],
        ),
      
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: ' ',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'attend'),
          FABBottomAppBarItem(iconData: Icons.note, text: 'notes'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Info'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.redAccent,
        //isExtended: true,
        mini: false,
        elevation: 4,
        tooltip: list[_getIndex(list)]['fname'] + " " +list[_getIndex(list)]['lname'],
        child: Text(list[_getIndex(list)]['fname'][0]),
      ),
      drawer: Drawer(
        child: DrawerMenu(list:list,index: _getIndex(list),),
      ),
    );
  }
}