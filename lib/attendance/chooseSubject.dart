import 'package:flutter/material.dart';
import '../utils/constant.dart';
import 'takeAttendance.dart';
import 'getSubject.dart';

class ChooseSubject extends StatefulWidget {
  final String department;
  final String year;
  final String semester;
  final String subject;
  
  ChooseSubject({Key key,this.department,this.year,this.semester,this.subject});

  @override
  _ChooseSubjectState createState() => _ChooseSubjectState();
}

class _ChooseSubjectState extends State<ChooseSubject> {
  TextEditingController subject = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.department);
    print(widget.year);
    print(widget.semester);
  }  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Subject'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 8.0,),
            GetSubjects(
              icon: Icon(Icons.book, color: Colors.redAccent,), 
              boxName: "subject", 
              input: subject,
              url: Constant.getSubjects,
              department: widget.department,
              year: widget.year,
              semester: widget.semester,
            ),
            SizedBox(height: 8.0,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        icon: Icon(Icons.add_circle_outline,color: Colors.yellowAccent),
        label: Text('Take Attendance',style: TextStyle(color: Colors.yellowAccent)),
        isExtended: true,
        tooltip: 'Take Attendance',
        onPressed: (){
          print(widget.department);
          print(widget.year);
          print(widget.semester);
          print(subject.text);
          Navigator
          .of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => TakeAttendance(
                department: widget.department,
                year: widget.year,
                semester: widget.semester,
                subject: subject.text,
              ),
            )
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}