import 'package:flutter/material.dart';

class TempList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 400.0,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var singleChildScrollView = SingleChildScrollView(
            reverse: true,
            primary: true,
            scrollDirection: Axis.vertical,
            child: Row(
              children: <Widget>[
                TempListItem(),
              ],
            ),
          );
          return singleChildScrollView;
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class TempListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,8.0,4.0,4.0),
      child: Container(
        height: 100.0,
        width: 348.0,
        child: Material(
          type: MaterialType.card,
          color: Colors.white,
          elevation: 5.0,
          borderRadius: BorderRadius.circular(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Text("news feed"),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}