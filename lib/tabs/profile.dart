import 'package:flutter/material.dart';
import './ProfileCard.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final image = new Image(
    image : new AssetImage('assets/profile/ambuja.jpg'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //leading: Icon(Icons.menu),
            backgroundColor: Colors.redAccent,
            expandedHeight: 426,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: <Widget>[
                  Container(
                    height: 450,
                    width: 420,
                    child: image,
                  )
                ],
              ),
              title: Text("Ambuj Kumar"),
              centerTitle : true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Column(
                    children: <Widget>[
                      ProfileCard(),
                      ProfileCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}