import 'package:flutter/material.dart';
import '../FrontWidget/timeTableDialog.dart';

class TimeTable extends StatefulWidget {

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    var image = Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(3.0, 3.0)
          ),
        ],
        image: DecorationImage(
          image: AssetImage('assets/images/ambuja.jpg'),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,8.0,4.0,4.0),
      child: GestureDetector(
        onDoubleTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TimeTableDialog(),
          ));
        },
        child: Hero(
          tag: "timetable",
          child: Container(
            height: 200.0,
            width: 400.0,
            child: Material(
              color: Colors.white,
              elevation: 5.0,
              borderRadius: BorderRadius.circular(15.0),
              child: Center(
                child: image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}