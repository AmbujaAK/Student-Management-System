import 'package:flutter/material.dart';

class InnerBottomWidget extends StatelessWidget {
  final String authorName;
  final List list;
  InnerBottomWidget({
    Key key,
    this.list,
    this.authorName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Announced by :-",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                authorName,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 25
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}