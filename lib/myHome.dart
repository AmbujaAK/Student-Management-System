import 'package:flutter/material.dart';
import './tabs/home.dart';
import './tabs/history.dart';
import 'drawerMenu.dart';
import 'popUpMenu.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  //final assetsImage = new AssetImage('assets/profile/ambuja.jpg');
  final image = new Image(
    image : new AssetImage('assets/profile/ambuja.jpg'),
    width: 100,
    height: 100
    );

  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text("Dashboard"),
            actions: <Widget>[
              PopUpMenu(),
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.perm_identity)),
                Tab(icon: Icon(Icons.history)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Home(),
              //Profile(),
              Container(color: Colors.red[100],),
              Container(
                child: Column(
                  children: <Widget>[
                    HistoryCard(),
                    HistoryCard(),
                    HistoryCard(),
                  ],
                ),
              ),
            ],
          ),

          drawer: Drawer(
            child: DrawerMenu(),
          ),
        ),
      ),
    );
  }
}