import 'package:flutter/material.dart';
import 'facultyDetailsUtil.dart';

class FacultyDetails extends StatelessWidget {
  final List list;
  final int index;
  FacultyDetails({Key key,this.list,this.index}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          tag: list[index]['faculty_id'],
          child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.redAccent,
              expandedHeight: 335,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: <Widget>[
                    Container(
                      height: 360,
                      width: 420,
                      child: Image.network(list[index]['img_url']),
                    )
                  ],
                ),
                title: Text(list[index]['fname'] + " " + list[index]['lname']),
                centerTitle : true,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Column(
                      children: <Widget>[
                        FacultyDetailsUtil(list: list,index: index),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}