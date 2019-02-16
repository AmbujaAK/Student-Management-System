import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {

  final int index;
  SingleItem({key, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'Item $index',
            style: Theme.of(context).textTheme.headline,
          ),
        ],
      ),
    );
  }
}