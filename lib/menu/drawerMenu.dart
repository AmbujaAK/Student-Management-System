import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

import '../student/studentList.dart';
import '../faculty/facultyList.dart';
import '../utils/sharedPref.dart';
import '../auth/loginApp.dart';
import '../attendance/attendance.dart';
import '../announcement/announcements.dart';
import '../animation/flipAnimation.dart';
import '../profile/editStudentProfile.dart';
//import '../firebase/attendance.dart';
import 'about.dart';

class DrawerMenu extends StatelessWidget {
  final List list;
  final int index;
  DrawerMenu({Key key, this.list, this.index =0});

  @override
  Widget build(BuildContext context) {
    final textColor =Colors.black87;
    final iconColor = Colors.black54;
    final bgColor = Colors.white;
    final btnColor = Colors.white;
    final btnTextColor =Colors.redAccent;
    final shadowColor =Colors.black12;
    final cCompleted = Colors.redAccent;
    final cRemaining =Colors.black12;

    final boxShadow = [ BoxShadow(
        color: shadowColor,
        blurRadius: 5.0,
        spreadRadius: 2.0,
        offset: Offset(3.0, 3.0)
      ),
    ];
    final GlobalKey<AnimatedCircularChartState> _chartKey1 = new GlobalKey<AnimatedCircularChartState>();
    final GlobalKey<AnimatedCircularChartState> _chartKey2 = new GlobalKey<AnimatedCircularChartState>();
    
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
          new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
          new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
          new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];

    var image = Container(
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: boxShadow,
        image: DecorationImage(
          image: NetworkImage(this.list[this.index]['img_url']),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );

    var drawerHeader = DrawerHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FlipAnimation(image: image,),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0,0.0,0.0,0.0),
            child: Container(
              height: 150,
              width: 160,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      width: 150.0,
                      child: Text(
                        this.list[this.index]['fname'] + " " +this.list[this.index]['lname'],
                        style: TextStyle(
                          color: textColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 150.0,
                      child: Text(
                        this.list[this.index]['student_id'],
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15.0,
                          ),
                        ),
                    ),
                    SizedBox(height: 30.0,),
                    Container(
                      height: 30.0,
                      width: 150,
                      decoration: BoxDecoration(
                        color: btnColor,
                        boxShadow: boxShadow,
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Align(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator
                              .of(context)
                              .push(
                                MaterialPageRoute(
                                  builder: (context) => EditStudentProfile(list: list,),
                                  fullscreenDialog: true,
                                ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5.0,0.0,0.0,0.0),
                                child: Text(
                                  "edit information",
                                  style: TextStyle(
                                    color: btnTextColor,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: btnTextColor,
                              ),
                            ],
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      decoration: BoxDecoration(
        color: bgColor
      ),
    );
    
    var attendanceChart = new AnimatedCircularChart(
      key: _chartKey1,
      size: const Size(100.0, 100.0),
      initialChartData: <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              33.33,
              cCompleted,
              rankKey: 'completed',
            ),
            new CircularSegmentEntry(
              66.67,
              cRemaining,
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: true,
      holeLabel: '33',
      labelStyle: new TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );  

    var projectChart = new AnimatedCircularChart(
      key: _chartKey2,
      size: const Size(100.0, 100.0),
      initialChartData: <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              20.00,
              cCompleted,
              rankKey: 'completed',
            ),
            new CircularSegmentEntry(
              80.00,
              cRemaining,
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: true,
      holeLabel: '20',
      labelStyle: new TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );  

    var activitiesTitle = Container(
      alignment: Alignment(-1, 0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0,2.0,2.0,2.0),
        child: Text(
          "My Recent Activities",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    
    var activitiesContent = Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                attendanceChart,
                Text(
                  "Attendance",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                projectChart,
                Text(
                  "Project",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    var activities = Padding(
      padding: const EdgeInsets.fromLTRB(8.0,0.0,0.0,0.0),
      child: Material(
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            activitiesTitle,
            SizedBox(height: 2.0,),
            activitiesContent
          ],
        ),
      ),
    );

    var attendance =ListTile(
      leading: Icon(Icons.class_,color: iconColor,),
      title: Text(
        'Attendance',
        style: TextStyle(
          color: textColor
        ),
      ),
      onTap: () {

      },
      onLongPress: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Attendance(),
          )
        );
      },
    );

    var myAccount = ListTile(
      leading: Icon(
        Icons.dashboard,
        color: iconColor,
      ),
      title: Text(
        'My Account',
        style: TextStyle(
          color: textColor
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );

    var studentMenu = ListTile(
      leading: Icon(Icons.person,color: iconColor,),
      title: Text(
        'Students',
        style: TextStyle(
          color: textColor
        ),
      ),
      onTap: () {
        //Navigator.pop(context);
        Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => StudentList(),
          )
        );
      },
    );
    
    var facultyMenu = ListTile(
      leading: Icon(Icons.person_outline,color: iconColor,),
      title: Text(
        'Faculty',
        style: TextStyle(
          color: textColor
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FacultyList(),
          )
        );
      },
    );

    var notificationMenu = ListTile(
      leading: Icon(Icons.notifications,color: iconColor,),
      title: Text(
        'Notifications',
        style: TextStyle(
          color: textColor
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Announcement(),
          )
        );
      },
    );

    var inboxMenu = ListTile(
      leading: Icon(Icons.inbox,color: iconColor,),
      title: Text(
        'inbox',
        style: TextStyle(
          color: textColor
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );

    var settingsMenu = ListTile(
      leading: Icon(Icons.settings,color: iconColor,),
      title: Text(
        'Settings',
        style: TextStyle(
          color: textColor
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );

    var aboutMenu = ListTile(
      leading: Icon(Icons.info,color: iconColor,),
      title: Text(
        'About',
        style: TextStyle(
          color: textColor
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => About(),
          )
        );
      },
    );

    var logoutBtn = Padding(
      padding: const EdgeInsets.all(14.0),
      child: ButtonTheme(
        minWidth: 150,
        height: 48,
        child: RaisedButton(
          color: btnColor,
          child: Text(
            "Log Out",
            style: TextStyle(
              color: btnTextColor
            ),
          ),
          onPressed: (){
            clearPref();
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => LoginApp()),
            );
          },
        ),
      ),
    );

    return Container(
      color: bgColor,
      child: ListView(
        //padding: EdgeInsets.zero,
        children: <Widget>[
          drawerHeader,

          activities,
          
          new Divider(color: Colors.black26, indent: 16.0,),
          
          myAccount,
          studentMenu,
          facultyMenu,
          attendance,
          notificationMenu,
          inboxMenu,
          settingsMenu,
          aboutMenu,

          logoutBtn,
        ],
      ),
    );
  }
}