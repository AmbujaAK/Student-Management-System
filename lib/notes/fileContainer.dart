import 'package:flutter/material.dart';
import 'folder.dart';
import 'file.dart';

class FileContainer extends StatelessWidget {
  final String title;
  final String userId;
  final String userType;

  FileContainer({
    Key key,
    this.title,
    this.userId,
    this.userType
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
        backgroundColor: Colors.yellow[700],
      ),
      backgroundColor: Colors.yellow[700],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Folder(heightFactor: 0.15,widthFactor: 0.45,folderName: "PR"),
                    Folder(heightFactor: 0.15,widthFactor: 0.45,folderName: "Managemnt")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Folder(heightFactor: 0.15,widthFactor: 0.45,folderName: "DSP"),
                    Folder(heightFactor: 0.15,widthFactor: 0.45,folderName: "DS")
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