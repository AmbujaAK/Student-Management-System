import 'package:flutter/material.dart';
import '../menu/notesPopUpMenu.dart';
import 'noteContainer.dart';

import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'file.dart';
import 'package:path/path.dart' as p;

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

  _getFolder(String currFolder) async {
    Directory root = await getExternalStorageDirectory();
    var folderList = await FileManager.listDirectories(root.path + "/JUSMS/" + currFolder);
    
    currPath = root.path + "/JUSMS/" + currFolder;
    print('Notes layout :' + currPath);
    print('Folder list :: $folderList');
    print(currPath);
    return folderList;
  }

  _getFile(String currFolder) async {
    Directory root = await getExternalStorageDirectory();
    //var folderList = await FileManager.listDirectories(root.path + "/JUSMS/" + currFolder);
    var fileList = await FileManager.listFiles(root.path + "/JUSMS/" + currFolder);
    //var folderList = await FileManager.
    currPath = root.path + "/JUSMS/" + currFolder;
    print('Notes layout :' + currPath);
    print('Files :: $fileList');
    print(currPath);
    return fileList;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0.0,
          backgroundColor: Colors.red[400],
          actions: <Widget>[
            NotesPopUpMenu(currentPath: currPath),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.folder)),
              Tab(icon: Icon(Icons.folder_open))
            ],
          ),
        ),
        backgroundColor: Colors.red[400],
        body: TabBarView(
          children: <Widget>[
            FutureBuilder(
              future: _getFolder(widget.title),
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
                                      builder: (context) => NotesContainer(
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
            ),
            FutureBuilder(
              future: _getFile(widget.title),
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
                            itemBuilder: (context, index) => File(
                              heightFactor: 0.08,
                              fileName: snapshot.data[index].absolute.path.toString().substring(32),
                              fileSize: '10',
                              filePath: snapshot.data[index].absolute.path.toString(),
                              fileType: p.extension(snapshot.data[index].absolute.path).replaceFirst('.', ''),
                            )
                          )
                        : Center(
                            child: Text("Nothing!"),
                          );
                }
                return null; // unreachable
              },
            ),
          ],
        )
      ),
    );
  }
}