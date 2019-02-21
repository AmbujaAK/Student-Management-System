import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String table;
  final List list;
  final int index;
  DropDown({Key key, this.table,this.list, this.index});
  
  final dropdown = Container(
    //width: 40.0,
    height: 30.0,
    decoration: BoxDecoration(
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: DropdownButton<String>(
      hint: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          "table_name",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      ),
      items: <String>['item1','item2','item3','item4'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,),
        );
      }).toList(),
      onChanged: (_){},
    )
  );

  
  @override
  Widget build(BuildContext context) {
    return dropdown;
  }
}