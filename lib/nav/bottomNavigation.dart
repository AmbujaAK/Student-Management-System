import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../menu/popUpMenu.dart';
import '../menu/drawerMenu.dart';
import '../utils/sharedPref.dart';
import '../utils/constant.dart';
import '../nav/fab_with_icons.dart';
import '../nav/fab_bottom_app_bar.dart';
import '../nav/layout.dart';

class BottomNavigation extends StatefulWidget {
  final String userId;
  BottomNavigation({Key key,this.userId});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with TickerProviderStateMixin {

  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  List list = List();
  var isLoading =true;

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
    getUserId().then(updateUserId);
    _fetchData();
    super.initState();
  }

  void updateUserId(String usename){
    setState(() {
     this.name = usename;
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

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: <Widget>[
          PopUpMenu(),
        ],
      ),
      body: Center(
        child: Text(
          _lastSelected,
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'A',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
      drawer: Drawer(
        child: DrawerMenu(list:list,index: _getIndex(list),),
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}