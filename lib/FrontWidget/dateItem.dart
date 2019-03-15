import 'package:flutter/material.dart';

class DateItem extends StatefulWidget {
  final Color color;
  final currentDate;
  final index;
  DateItem({
    Key key,
    this.color,
    this.currentDate,
    this.index,
  }):super(key:key);

  @override
  _DateItemState createState() => _DateItemState();
}

class _DateItemState extends State<DateItem> {
  @override
  Widget build(BuildContext context) {

    var dayArray =["SUN","MON","TUE","WED","THUS","FRI","SAT"];

    var date =widget.currentDate;
    var currDate =DateTime.now().day;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,8.0,4.0,4.0),
      child: Container(
        width: 70.0,
        child: Material(
          color: Colors.white,
          elevation: 5.0,
          borderRadius: BorderRadius.circular(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  dayArray[(widget.index + 6)% 7],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: date ==currDate ? Colors.redAccent:Colors.black38,
                  ),
                ),
                Text(
                  date.toString(),
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: date ==currDate ? Colors.redAccent:Colors.black38,
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}