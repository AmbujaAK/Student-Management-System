import 'package:flutter/material.dart';

class DialogItem extends StatelessWidget {
  final List list;
  DialogItem({Key key, this.list}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(list[index]['fname'] + " " +list[index]['lname']),
        );
      },
    );
  }
}
