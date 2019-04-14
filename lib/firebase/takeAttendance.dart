import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TakeAttendance1 extends StatefulWidget {
  final int semester;
  TakeAttendance1({Key key, this.semester});

  @override
  _TakeAttendance1State createState() => _TakeAttendance1State();
}

class _TakeAttendance1State extends State<TakeAttendance1> {
  Firestore firestore =Firestore();

  @override
  void initState() {
    super.initState();
    firestore.settings(timestampsInSnapshotsEnabled: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Name"),
      ),
      body: _buildBody(context, widget.semester),
    );
  }
}

Widget _buildBody(BuildContext context, int semester){
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('Students').snapshots(),
    builder: (context,snapshot) {
      if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

      return _buildList(context, snapshot.data.documents,semester);
    },
  );
  
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot, int semester){
  return ListView(
    padding: EdgeInsets.only(top: 20.0),
    children: snapshot.map(
      (data) => _buildListItem(context,data,semester)
    ).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data, int semester){
  final record = Record.fromSnapshot(data,semester);

  return Padding(
    key: ValueKey(record.name),
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text(record.name),
        trailing: Text(record.attendSem.toString()),
         onTap: () => Firestore.instance.runTransaction((transaction) async {
           final freshSnapshot = await transaction.get(record.reference);
            final fresh = Record.fromSnapshot(freshSnapshot,semester);
            
            await transaction
            .update(record.reference, {'attendSem$semester': fresh.attendSem + 1});
         }),
      ),
    ),
  );
}

class Record {
  final int roll;
  final String name;
  final int attendSem;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map,int sem, {this.reference})
      : assert(map['name'] != null),
        assert(map['roll'] != null),
        assert(map['attendSem$sem'] !=null),
        name = map['name'],
        roll = map['roll'],
        attendSem = map['attendSem$sem'];

  Record.fromSnapshot(DocumentSnapshot snapshot, int sem)
      : this.fromMap(snapshot.data,sem, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$attendSem>";
}