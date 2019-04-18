import 'package:flutter/material.dart';

import '../FrontWidget/dateWidget.dart';
import '../FrontWidget/TempList.dart';
import '../notes/folder.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          DateWidget(),
          //NewsFeed(color: Colors.white),
          //TimeTable(),
          TempList(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Folder(
                  iconSize: 40,
                  folderName: "Study",
                  heightFactor: 0.20,
                  widthFactor: .45,
                ),
                Folder(
                  iconSize: 40,
                  folderName: "Questions",
                  heightFactor: 0.20,
                  widthFactor: .45,
                )
              ],
            ),
          ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Folder(
                  iconSize: 40,
                  folderName: "PDFs",
                  heightFactor: 0.20,
                  widthFactor: .45,
                ),
                Folder(
                  iconSize: 40,
                  folderName: "Time Table",
                  heightFactor: 0.20,
                  widthFactor: .45,
                )              
              ],
            ),
          ),
        ],
      ),
    );
  }
}