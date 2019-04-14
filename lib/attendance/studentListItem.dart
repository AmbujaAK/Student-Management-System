import 'package:flutter/material.dart';

class StudentListItem extends StatefulWidget {
  final List list;
  final int index;
  StudentListItem({Key key, this.list, this.index}):super(key:key);

  @override
  _StudentListItemState createState() => _StudentListItemState();
}

class _StudentListItemState extends State<StudentListItem> {
  bool isPresent = false;

  void _value1Changed(bool value) => setState(() => isPresent = value);

  @override
  void initState() {
    super.initState();
    isPresent = false;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list ==null ? 0 :widget.list.length,
      itemBuilder: (context, index){
        return Hero(
          tag: widget.list[index]['student_id'],
          child: ListTile(
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(
                  image: NetworkImage(widget.list[index]['img_url']),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
            ),
            title: Text(widget.list[index]['fname'] + " " +widget.list[index]['lname']),
            subtitle: Text(widget.list[index]['student_id']),
            trailing: Checkbox(
              activeColor: Colors.redAccent,
              value: isPresent,
              onChanged: _value1Changed,
              checkColor: Colors.redAccent,
            ),
          ),
        );
      },
    );
  }
}