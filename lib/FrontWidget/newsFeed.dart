import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,8.0,4.0,4.0),
      child: Container(
        height: 100.0,
        width: 400.0,
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