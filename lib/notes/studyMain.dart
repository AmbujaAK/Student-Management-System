import 'package:flutter/material.dart';
import 'folder.dart';
import 'file.dart';

class StudyMain extends StatelessWidget {
  final String userId;
  final String userType;

  StudyMain({
    Key key,
    this.userId,
    this.userType
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        elevation: 0.0,
        backgroundColor: Colors.yellow[700],
      ),
      backgroundColor: Colors.yellow[700],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Folder(
              folderIcon: Icon(Icons.folder_open,size: 40,color: Colors.yellow[700],),
              heightFactor: 0.15,
              widthFactor: 1,
              folderName: "Source File",
              addIcon: Icon(Icons.add),
              iconSize: 40.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Folder(heightFactor: 0.15,widthFactor: 0.45,folderName: "1st Year"),
                    Folder(heightFactor: 0.15,widthFactor: 0.45,folderName: "2nd Year")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Folder(heightFactor: 0.15,widthFactor: 0.45,folderName: "3rd Year"),
                    Folder(heightFactor: 0.15,widthFactor: 0.45,folderName: "4th Year")
                  ],
                ),
                File(heightFactor: 0.10,widthFactor: 0.95,fileName: 'Networking',fileSize: "1.5 MB"),
                File(heightFactor: 0.10,widthFactor: 0.95,fileName: 'Operating System',fileSize: "2.4 MB"),
                File(heightFactor: 0.10,widthFactor: 0.95,fileName: 'Compiler Design',fileSize: "3.2 MB"),
                File(heightFactor: 0.10,widthFactor: 0.95,fileName: 'Artificial Inteligence',fileSize: "5.6"),
              ],
            )
          ],
        ),
      ),
    );
  }
}