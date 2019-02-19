import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: Text('menu 1'),
        ),        
        PopupMenuItem(
          child: Text('menu 2'),
        ),
        PopupMenuItem(
          child: Text('menu 3'),
        ),
      ],
    );
  }
}