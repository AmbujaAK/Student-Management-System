import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
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
                color: Colors.green[50],
                width: 420,
                height: 60,
                child: Center(
                  child: Text("History",)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}