import 'package:flutter/material.dart';

import '../FrontWidget/dateItem.dart';

class DateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentdate = new DateTime.utc(2018,3,1);
    var currMonth= new DateTime.now().month;

    print(currMonth);

    return  Container(
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
        );
  }
}