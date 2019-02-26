import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {
  final String name;
  final int index;
  Home1({
    Key key,
    this.name,
    this.index,
  }):super(key:key);

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.name), 
    );
  }
}