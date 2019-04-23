import 'package:flutter/material.dart';

import 'package:flutter_file_manager/flutter_file_manager.dart';

import '../menu/notesPopUpMenu.dart';

class YearLayout extends StatefulWidget {
  final String title;
  final String currPath;
  YearLayout({
    Key key,
    this.title,
    this.currPath
  });

  @override
  _YearLayoutState createState() => _YearLayoutState();
}

class _YearLayoutState extends State<YearLayout> {
  String currPath ;
  _files(String curr, String folderName) async {
    //Directory root = await getExternalStorageDirectory();
    var files = await FileManager.listDirectories(curr + '/'+ folderName);
    currPath = curr + '/'+ folderName;
    print(files);
    
    return files;
  }

  int _getLength(String currPath){
    return currPath.length+1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
        backgroundColor: Colors.red[400],
        actions: <Widget>[
          NotesPopUpMenu(currentPath: widget.title),
        ],
      ),
      backgroundColor: Colors.red[400],
      body: FutureBuilder(
        future: _files(widget.currPath, widget.title),
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
                                builder: (context) => YearLayout(
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
      )
    );
  }
}