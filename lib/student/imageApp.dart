import 'package:flutter/material.dart';

class ImageApp extends StatelessWidget {
  final List list;
  final int index;

  ImageApp({Key key, this.list, this.index}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Image.network(list[index]['img_url']);
  }
}