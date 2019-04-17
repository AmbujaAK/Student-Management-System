import 'package:flutter/material.dart';

class InnerTopWidget extends StatelessWidget {
  final String details;
  final List list;
  InnerTopWidget({
    Key key,
    this.list,
    this.details
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          // Details
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(color: Colors.yellow,),

          // Title 
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      details,
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 20
                      ),
                    ),
                  ),
                ) // title
              ],
            ),
          ),
        ],
      ),
    );
  }
}