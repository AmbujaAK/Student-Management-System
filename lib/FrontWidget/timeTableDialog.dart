import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class TimeTableDialog extends StatefulWidget {
  @override
  TimeTableDialogState createState() => new TimeTableDialogState();
}

class TimeTableDialogState extends State<TimeTableDialog> {

  var image2 =Container(
    child: PhotoView(
      heroTag: "timetable",
      controller: PhotoViewController(),
      imageProvider: AssetImage('assets/images/ambuja.jpg'),
      enableRotation: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('time table'),
      ),
      body: Center(child: image2),
    );
  }
}