import 'package:flutter/material.dart';

import 'package:flutter_file_manager/flutter_file_manager.dart';

import '../menu/notesPopUpMenu.dart';
import 'file.dart';

class NotesContainer extends StatefulWidget {
  final String title;
  final String currPath;
  NotesContainer({
    Key key,
    this.title,
    this.currPath
  });

  @override
  _NotesContainerState createState() => _NotesContainerState();
}

class _NotesContainerState extends State<NotesContainer> {
  String currPath ;
  _getFolder(String curr, String folderName) async {
    //Directory root = await getExternalStorageDirectory();
    var files = await FileManager.listDirectories(curr + '/'+ folderName);
    currPath = curr + '/'+ folderName;
    print(files);
    
    return files;
  }

  _getFile(String curr, String folderName) async {
    //Directory root = await getExternalStorageDirectory();
    //var folderList = await FileManager.listDirectories(root.path + "/JUSMS/" + currFolder);
    var fileList = await FileManager.listFiles(curr + '/' + folderName);
    //var folderList = await FileManager.
    currPath = curr + '/' + folderName;
    print('Notes layout :' + currPath);
    print('Files :: $fileList');
    print(currPath);
    return fileList;
  }

  int _getLength(String currPath){
    return currPath.length+1;
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
            NotesPopUpMenu(currentPath: widget.currPath, title: widget.title),
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
              future: _getFolder(widget.currPath, widget.title),
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
                                title: Text(snapshot.data[index].absolute.path.toString().substring(_getLength(currPath))),
                                trailing: Icon(Icons.more_vert),
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => NotesContainer(
                                        title: snapshot.data[index].absolute.path.toString().substring(_getLength(currPath)),
                                        currPath: currPath,
                                      )
                                    )
                                  );
                                  print('passing value :: ');
                                  print(snapshot.data[index].absolute.path.toString().substring(_getLength(currPath)));
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
              future: _getFile(widget.currPath, widget.title),
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
                              fileName: snapshot.data[index].absolute.path.toString().substring(_getLength(currPath)),
                              fileSize: '20',
                              filePath: snapshot.data[index].absolute.path.toString(),
                              //fileSize: p.extension(snapshot.data[index].absolute.path).replaceFirst('.', ''),
                            )
                            /*
                            Card(
                              child: ListTile(
                                leading: Icon(Icons.folder,color: Colors.yellow[700],),
                                title: Text(snapshot.data[index].absolute.path.toString().substring(_getLength(currPath))),
                                trailing: Icon(Icons.more_vert),
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => File(
                                        title: snapshot.data[index].absolute.path.toString().substring(_getLength(currPath)),
                                        currPath: currPath,
                                      )
                                    )
                                  );
                                  print('passing value :: ');
                                  print(snapshot.data[index].absolute.path.toString().substring(_getLength(currPath)));
                                  print(currPath);
                                },
                              )
                            ),
                            */
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