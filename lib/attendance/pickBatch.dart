import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class PickBatch extends StatefulWidget {
  PickBatch({Key key, DateTime dateTime,int semester, @required this.onChanged,@required this.onSemChanged})
      : assert(onChanged != null),
        date = dateTime == null
            ? new DateTime.now()
            : new DateTime(dateTime.year, dateTime.month, dateTime.day),
        sem=semester ==null
            ? 1
            : semester,
        super(key: key);

  final DateTime date;
  int sem;
  final ValueChanged<DateTime> onChanged;
  final ValueChanged<int> onSemChanged;

  @override
  _PickBatchState createState() => _PickBatchState();
}

class _PickBatchState extends State<PickBatch> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new InkWell(
            onTap: (() => _showDatePicker(context)),
            child: new Padding(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                child: new Text(new DateFormat('EE, MMMM d').format(widget.date))),
          ),
        ),
        new InkWell(
          onTap: (() => _showSemesterPicker(context)),
          child: new Padding(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              child: new Text("semester : ${widget.sem}")),
        ),
      ],
    );
  }

  _showSemesterPicker(BuildContext context) async {
    showDialog<int>(
      context: context,
      builder: (BuildContext context){ 
        return new NumberPickerDialog.integer(
          initialIntegerValue: 1,
          minValue: 1,
          maxValue: 8,
          title: new Text("Select semester"),
        );
      }
    ).then((value) {
      if (value != null) {
        widget.onSemChanged(
          widget.sem =value,
        );
      }
    });
  }

  Future _showDatePicker(BuildContext context) async {
    DateTime dateTimePicked = await showDatePicker(
        context: context,
        initialDate: widget.date,
        firstDate: widget.date.subtract(const Duration(days: 20000)),
        lastDate: new DateTime.now());

    if (dateTimePicked != null) {
      widget.onChanged(new DateTime(dateTimePicked.year, dateTimePicked.month,
          dateTimePicked.day,));
    }
  }
}