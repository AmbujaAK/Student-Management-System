import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

import '../student/studentList.dart';
import '../faculty/facultyList.dart';
import '../utils/sharedPref.dart';
import '../auth/loginApp.dart';
import '../attendance/attendance.dart';

class DrawerMenu extends StatelessWidget {
  final List list;
  final int index;
  DrawerMenu({Key key, this.list, this.index});

  @override
  Widget build(BuildContext context) {
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
    
    var attendanceChart = new AnimatedCircularChart(
      key: _chartKey1,
      size: const Size(100.0, 100.0),
      initialChartData: <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              33.33,
              Colors.blue[400],
              rankKey: 'completed',
            ),
            new CircularSegmentEntry(
              66.67,
              Colors.red,
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
        color: Colors.white,
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
              Colors.blue[400],
              rankKey: 'completed',
            ),
            new CircularSegmentEntry(
              80.00,
              Colors.red,
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
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );  

    var attendance =ListTile(
      leading: Icon(Icons.class_,color: Colors.white,),
      title: Text(
        'Attendance',
        style: TextStyle(
          color: Colors.white
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Attendance(),
          )
        );
      },
    );

    return Container(
      color: Colors.redAccent,
      child: ListView(
        //padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    image: DecorationImage(
                      image: NetworkImage(this.list[this.index]['img_url']),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                  child: Container(
                    height: 150,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
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
                                color: Colors.white,
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
                                color: Colors.white70,
                                fontSize: 15.0,
                                ),
                              ),
                          ),
                          SizedBox(height: 30.0,),
                          Container(
                            height: 30.0,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Align(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(6.0,0.0,0.0,0.0),
                                    child: Text(
                                      "edit information",
                                      style: TextStyle(
                                        color: Colors.yellowAccent,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.yellow,
                                  ),
                                ],
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
              color: Colors.redAccent
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,0.0,0.0,0.0),
            child: Material(
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment(-1, 0),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12.0,2.0,2.0,2.0),
                      child: Text(
                        "My Recent Activities",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
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
                                  color: Colors.white,
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          new Divider(color: Colors.red, indent: 16.0,),

          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            title: Text(
              'My Account',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person,color: Colors.white,),
            title: Text(
              'Students',
              style: TextStyle(
                color: Colors.white
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
          ),
          ListTile(
            leading: Icon(Icons.person_outline,color: Colors.white,),
            title: Text(
              'Faculty',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FacultyList(),
                )
              );
            },
          ),
          attendance,
          ListTile(
            leading: Icon(Icons.notifications,color: Colors.white,),
            title: Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.inbox,color: Colors.white,),
            title: Text(
              'inbox',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.white,),
            title: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.info,color: Colors.white,),
            title: Text(
              'About',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ButtonTheme(
              minWidth: 150,
              height: 48,
              child: RaisedButton(
                color: Colors.red,
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.yellowAccent
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
          )
        ],
      ),
    );
  }
}