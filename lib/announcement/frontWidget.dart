import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FrontWidget extends StatelessWidget {
  final List list;
  final String subject;
  final String eventDay;
  final String eventTime;
  final String eventDate;
  final String location;
  final String priority;
  FrontWidget({
    Key key,
    this.list,
    this.subject,
    this.eventDay,
    this.eventTime,
    this.eventDate,
    this.location,
    this.priority
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      color: Color(0xffdfd4f4),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.redAccent,
              ),
              
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              eventDay.toUpperCase().substring(0,3),
                              style: TextStyle(
                                //color: Color(0xFFc8b6ea),
                                color: Color(0xffffffff),
                                fontSize: 20.0
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              eventTime.toString().substring(0,5) + 'AM',
                              style: TextStyle(
                                //color: Color(0xFFc8b6ea),
                                color: Color(0xffffffff),
                                fontSize: 20.0
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0xffffffff),
              ),
              // container 2
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        subject,
                        style:TextStyle(
                          color:Color(0xff6a53a4),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              color:Color(0xffF7B928),
                              size: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              location,
                              style: TextStyle(
                                color: Color(0xffed1bf7),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}