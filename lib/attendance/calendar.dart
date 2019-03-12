import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class Calender extends StatefulWidget {
  String getTime(){
    return DateTime.now().toString().substring(11,16);
  }
  String getDate(){
    return TimeOfDay.now().toString().substring(0);
  }
  
  @override
  CalenderState createState() => new CalenderState();
}

class CalenderState extends State<Calender> {
  DateTime _selectedDate;
  DateTime _currentDate;
  @override
  void initState() {
    _selectedDate = DateTime.now();
    _currentDate =DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: CalendarCarousel<DateTime>(
        selectedDateTime: _selectedDate,
        selectedDayButtonColor: Colors.red,
        todayButtonColor: Colors.green,
        onDayPressed: (DateTime date, List<DateTime> list){
          setState(() {
           _selectedDate =date;
          });
        },
        weekendTextStyle: TextStyle(
          color: Colors.red,
        ),
        thisMonthDayBorderColor: Colors.grey,
        daysHaveCircularBorder: true, /// null for not rendering any border, true for circular border, false for rectangular border
        //minSelectedDate: _currentDate,
      ),
    );  
  }
}
