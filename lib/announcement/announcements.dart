import 'package:flutter/material.dart';

import 'announcementItem.dart';

class Announcement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Announcement"),
      ),
      body: Container(
        color: Color(0xffdfd4f4),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            AnnouncementItem(),
            AnnouncementItem(),
            AnnouncementItem(),
            AnnouncementItem(),
            AnnouncementItem(),
          ],
        ),
      )
    );
  }
}