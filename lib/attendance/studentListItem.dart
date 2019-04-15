import 'package:flutter/material.dart';

class StudentListItem extends StatefulWidget {
  final List list;
  final int index;
  final List presentStudentIdRecord;
  final String type;
  StudentListItem({
    Key key, 
    this.list, 
    this.index,
    this.presentStudentIdRecord,
    this.type,
    }):super(key:key);

  @override
  _StudentListItemState createState() => _StudentListItemState();
}

class _StudentListItemState extends State<StudentListItem> {
  //List _presentStudentIdRecord = List();

  void _onStudentSelected(bool selected, studentId) {
    if (selected == true) {
      setState(() {
        widget.presentStudentIdRecord.add(studentId);
      });
    } else {
      setState(() {
        widget.presentStudentIdRecord.remove(studentId);
      });
    }
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
            title: Text(widget.list[index]['name']),
            subtitle: Text(widget.list[index]['student_id']),
            //trailing: widget.type == "update" ? _checkBox(index) : countBox,
            trailing: widget.type == "update" 
            ? Checkbox(
              value: widget.presentStudentIdRecord.contains(widget.list[index]['student_id']),
              onChanged: (bool selected){
                _onStudentSelected(selected, widget.list[index]['student_id']);
              },
            )
            : Text(widget.list[index]['total_attendance']),
          ),
        );
      },
    );
  }
}