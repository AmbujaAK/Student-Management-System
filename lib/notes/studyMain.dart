import 'package:flutter/material.dart';
import '../menu/notesPopUpMenu.dart';
import 'yearLayout.dart';

import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Notes extends StatefulWidget {
  final String userId;
  final String userType;
  final String title;

  Notes({
    Key key,
    this.userId,
    this.userType,
    this.title
  });

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  String currPath;

  _files(String currFolder) async {
    Directory root = await getExternalStorageDirectory();
    var files = await FileManager.listDirectories(root.path + "/JUSMS/" + currFolder);
    print(files);
    currPath = root.path + "/JUSMS/" + currFolder;
    print('Notes layout :' + currPath);
    print(currPath);
    return files;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
        backgroundColor: Colors.red[400],
        actions: <Widget>[
          NotesPopUpMenu(currentPath: currPath),
        ],
      ),
      backgroundColor: Colors.red[400],
      body: FutureBuilder(
        future: _files(widget.title),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: Text('Awating ...'));
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              return snapshot.data != null
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          leading: Icon(Icons.folder,color: Colors.yellow[700],),
                          title: Text(snapshot.data[index].absolute.path.toString().substring(32)),
                          trailing: Icon(Icons.more_vert),
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => YearLayout(
                                  title: snapshot.data[index].absolute.path.toString().substring(32), 
                                  currPath: currPath
                                )
                              )
                            );
                            print('passing value :: ');
                            print(snapshot.data[index].absolute.path.toString().substring(32));
                            print(currPath);
                          },
                        )
                      )
                    )
                  : Center(
                      child: Text("Nothing!"),
                    );
          }
          return null; // unreachable
        },
      )
    );
  }
}