import 'package:flutter/material.dart';

class TempList extends StatelessWidget {
  final String widgetType;
  TempList({Key key,this.widgetType});
  
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,8.0,4.0,4.0),
      child: Container(
        height: _height * 0.28,
        width: _width * 0.46,
        child: Material(
          type: MaterialType.card,
          color: Colors.white,
          elevation: 1.0,
          borderRadius: BorderRadius.circular(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Text(
                    "news feed",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.grey,
                    ),
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