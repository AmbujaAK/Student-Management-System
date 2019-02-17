import 'package:flutter/material.dart';
import './studentDetailsUtil.dart';
import 'imageApp.dart';

class StudentDetails extends StatelessWidget {
  final List list;
  final int index;
  StudentDetails({Key key,this.list,this.index}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          tag: list[index]['student_id'],
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
                      child: ImageApp(list: list,index: index),
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
                        StudentDetailsUtil(list: list,index: index),
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