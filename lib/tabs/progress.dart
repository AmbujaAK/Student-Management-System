import 'package:flutter/material.dart';

class ProgressCard extends StatefulWidget {
  @override
  _ProgressCardState createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, -0.85),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            //shape: BeveledRectangleBorder(),
            elevation: 4,
            child: Center(
              child: Container(
                color: Colors.blue,
                width: 420,
                height: 160,
                child: Center(
                  child: Text("Notification",)
                ),
              ),
            ),
          ),
        ],
      ),       
    );
  }
}