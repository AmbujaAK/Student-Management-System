import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constant.dart';

enum DismissDialogAction {
  cancel,
  discard,
  save,
}

class AnnouncementForm extends StatefulWidget {
  final List list;
  final List user;
  AnnouncementForm({Key key, this.list,this.user});

  @override
  AnnouncementFormState createState() => AnnouncementFormState();
}

class AnnouncementFormState extends State<AnnouncementForm> {
  bool _hasName = false;
  String _eventName;

  String message="";
  String status="";
  
  TextEditingController detail  = new TextEditingController();
  TextEditingController eventDate = new TextEditingController();
  TextEditingController eventTime = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController priority = new TextEditingController();

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  _selectDate(BuildContext context) async{
    final DateTime datePicked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(1900),
      lastDate: new DateTime(2100),
    );

    if(datePicked != null && datePicked != _date){
      setState(() {
       _date = datePicked;
       eventDate.text = datePicked.toString().substring(0,10);
      });
    }
  }

  _selectTime(BuildContext context) async{
    final TimeOfDay timePicked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if(timePicked != null && timePicked != _time){
      setState(() {
       _time = timePicked;
       eventTime.text = timePicked.toString().substring(10,15);
      });
    }
  }

  _addAnnouncement() async {
    final res = await http.post(Constant.addAnnouncementUrl, body: {
      "author_id" : widget.user[0]['faculty_id'],
      "subject" : widget.user[0]['subject'],
      "detail" : detail.text,
      "event_date" : eventDate.text,
      "event_time" : eventTime.text,
      "location" : location.text,
      "priority" : priority.text
    });

    var response = json.encode(res.body);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    
    final authorId = TextFormField(
      autofocus: false,
      enabled: false,
      initialValue: widget.user[0]['faculty_id'],
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.network_locked,
            color: Colors.grey,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.security,
            color: Colors.grey,
          ),
        ),
        labelText: 'Author Id',
        hintText: 'Author Id',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final subjectApp = TextFormField(
      autofocus: false,
      enabled: false,
      initialValue: widget.user[0]['subject'],
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.network_locked,
            color: Colors.grey,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.security,
            color: Colors.grey,
          ),
        ),
        labelText: 'Subject',
        hintText: 'Subject',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final detailApp = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.multiline,
      controller: detail,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.class_,
            color: Colors.redAccent,
          ),
        ),
        labelText: 'Detail',
        hintText: 'Detail',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final eventDateApp = TextField(
      autofocus: false,
      controller: eventDate,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              print(_date);
              _selectDate(context);
              eventDate.text = _date.toString();
            },
            child: Icon(
              Icons.date_range,
              color: Colors.grey,
            ),
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.date_range,
            color: Colors.red,
          ),
        ),
        labelText: 'Event Date',
        hintText: 'Event Date',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final eventTimeApp = TextField(
      autofocus: false,
      controller: eventTime,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              print(_time);
              _selectTime(context);
            },
            child: Icon(
              Icons.access_time,
              color: Colors.grey,
            ),
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.date_range,
            color: Colors.red,
          ),
        ),
        labelText: 'Event Time',
        hintText: 'Event Time',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final locationApp = TextField(
      autofocus: false,
      keyboardType: TextInputType.multiline,
      controller: location,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.class_,
            color: Colors.redAccent,
          ),
        ),
        labelText: 'Location',
        hintText: 'Location',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    final priorityApp = TextField(
      autofocus: false,
      keyboardType: TextInputType.number,
      controller: priority,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.class_,
            color: Colors.redAccent,
          ),
        ),
        labelText: 'Priority',
        hintText: 'Priority',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_hasName ? _eventName : 'Add Announcement'),
        actions: <Widget> [
          FlatButton(
            child: Text(
              "save",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              _addAnnouncement();
              Navigator.pop(context, DismissDialogAction.save);
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 12.0, right: 12.0),
            children: <Widget>[
              authorId,
              SizedBox(height: 8.0,),
              subjectApp,
              SizedBox(height: 8.0,),
              detailApp,
              SizedBox(height: 8.0,),
              eventDateApp,
              SizedBox(height: 8.0,),
              eventTimeApp,
              SizedBox(height: 8.0,),
              locationApp,
              SizedBox(height: 8.0,),
              priorityApp
            ],
          ),
        ),
      ),    );
  }
}

//AnnouncementForm
/**
 * 0. Index or ID
 * 1. Author
 * 2. Details
 * 3. Subject
 * 4. Date
 * 5. Location
 * 6. Priority [ red=high, yellow=medium, green=low]
 */
