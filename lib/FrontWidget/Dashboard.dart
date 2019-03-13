import 'package:flutter/material.dart';

import '../FrontWidget/dateWidget.dart';
import '../FrontWidget/timeTable.dart';
import '../FrontWidget/newsFeed.dart';
import '../FrontWidget/TempList.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          DateWidget(),
          TimeTable(),
          NewsFeed(),
          TempList(),
        ],
      ),
    );
  }
}