import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'imageApp.dart';

class StudentDetails extends StatelessWidget {
  final List list;
  final int index;
  StudentDetails({Key key,this.list,this.index}):super(key:key);

  @override
  Widget build(BuildContext context) {

    _github() async {
      const url = 'https://ambujaak.github.io/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
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
                centerTitle : false,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Column(
                      children: <Widget>[
                        new ListTile(
                          leading: new Icon(Icons.account_box, color: Colors.red),
                          title: new Text(list[index]['fname'] + " " + list[index]['lname'], style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: new Text("Flutter developer"),
                        ),

                        new Divider(color: Colors.red, indent: 72.0,),

                        new ListTile(
                          leading: new Icon(Icons.class_, color: Colors.red),
                          title: new Text("Information Technology", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),

                        new Divider(color: Colors.red, indent: 72.0,),

                        new ListTile(
                          leading: new Icon(Icons.perm_identity, color: Colors.red),
                          title: new Text("001511001074", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),

                        new Divider(color: Colors.red, indent: 72.0,),

                        new ListTile(
                          leading: new Icon(Icons.email, color: Colors.red),
                          title: new Text("itsambuja@gmail.com", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),

                        new Divider(color: Colors.red, indent: 72.0,),

                        new ListTile(
                          leading: new Icon(Icons.phone, color: Colors.red),
                          title: new Text("+91-8935802059", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),

                        new Divider(color: Colors.red, indent: 72.0,),

                        new ListTile(
                          leading: new Icon(Icons.web, color: Colors.red),
                          title: InkWell(
                            child: new Text(
                              "ambujaak.github.io", 
                              style: TextStyle(color: Colors.lightBlueAccent),
                            ),
                            onTap: () => _github,
                          ),
                        ),

                        new Divider(color: Colors.red, indent: 72.0,),

                        new ListTile(
                          leading: new Icon(Icons.web, color: Colors.red),
                          title: InkWell(
                            child: new Text(
                              "www.linkedin.com/in/ambuj-kumar-83a5a7135", 
                              style: TextStyle(color: Colors.lightBlueAccent),
                            ),
                            onTap: () => _github,
                          ),
                        ),

                        new Divider(color: Colors.red, indent: 72.0,),

                        new ListTile(
                          leading: new Icon(Icons.web, color: Colors.red),
                          title: InkWell(
                            child: new Text(
                              "https://github.com/AmbujaAK", 
                              style: TextStyle(color: Colors.lightBlueAccent),
                            ),
                            onTap: () => _github,
                          ),
                        ),
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