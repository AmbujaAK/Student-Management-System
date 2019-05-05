import 'package:flutter/material.dart';

import '../FrontWidget/dateItem.dart';

class DateWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DateTime currentdate = new DateTime.now();
    var calender= new DateTime.now();

    _getDay(int index){
      currentdate =DateTime.utc(calender.year, calender.month, calender.day + index);
      return currentdate.day;
    }
    _getMonth(int index){
      currentdate =DateTime.utc(calender.year, calender.month, calender.day + index);
      return currentdate.month;
    }

    _getWeekDay(int index){
      currentdate =DateTime.utc(calender.year, calender.month, calender.day + index);
      return currentdate.weekday;
    }
    print('calender :: $calender');

    return  Container(
          height: 100.0,
          child: ListView.builder(
            itemCount: 100,
            addSemanticIndexes: bool.fromEnvironment("true"),
            itemBuilder: (context, index){
              var singleChildScrollView = SingleChildScrollView(
                reverse: true,
                primary: true,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    DateItem(
                      currentDate: _getDay(index),
                      currentMonth: _getMonth(index),
                      currentWeekDay: _getWeekDay(index),
                      index: index,
                    ),
                  ],
                ),
              );
              return singleChildScrollView;
            },
            scrollDirection: Axis.horizontal,
          ),
        );
  }
}