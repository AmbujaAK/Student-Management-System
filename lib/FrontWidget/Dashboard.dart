import 'package:flutter/material.dart';

import '../FrontWidget/dateItem.dart';
import '../FrontWidget/timeTable.dart';
import '../FrontWidget/newsFeed.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {

    var currentdate = new DateTime.utc(2018,3,1);
    var currMonth= new DateTime.now().month;

    print(currMonth);
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          child: ListView.builder(
            itemCount: 1000,
            addSemanticIndexes: bool.fromEnvironment("true"),
            itemBuilder: (context, index){
              var singleChildScrollView = SingleChildScrollView(
                reverse: true,
                primary: true,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    DateItem(currentDate: currentdate.day+index, index: index,),
                  ],
                ),
              );
              return singleChildScrollView;
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        TimeTable(),
        NewsFeed(),
      ],
    );
  }
}