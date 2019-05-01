import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class NotesPopUpMenu extends StatefulWidget {
  final String currentPath;
  final String title;
  NotesPopUpMenu({
    Key key,
    this.currentPath,
    this.title
  });
  
  @override
  _NotesPopUpMenuState createState() => _NotesPopUpMenuState();
}

class _NotesPopUpMenuState extends State<NotesPopUpMenu> {
  TextEditingController folderName = new TextEditingController();

  createDir(String rootFolder, String folderName) async {
    //Directory baseDir = await getExternalStorageDirectory();
    print('popup got :: ');
    print(widget.currentPath);
    print(widget.title);
    
    if(widget.title.toString() == 'null')
      rootFolder = widget.currentPath ;
    else
      rootFolder = widget.currentPath + '/' + widget.title;
    
    String dirToBeCreated = folderName;
    String finalDir = join(rootFolder+ '/', dirToBeCreated);
    
    var dir = Directory(finalDir);
    bool dirExists = await dir.exists();
    if(!dirExists){
      dir.create(/*recursive=true*/);
    }else{
      print('created :: $dir');
    }
  }

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Enter the folder name"),
          content: new TextField(
            controller: folderName,
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Create"),
              onPressed: () {
                createDir("",folderName.text);
                print(folderName.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
      var createFolder = Padding(
      padding: const EdgeInsets.all(14.0),
      child: InkWell(
        child: Text(
          "New Folder",
        ),
        onTap: (){
          _showDialog(context);
        },
      ),
    );

    return new PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: createFolder,
        ),
      ],
    );
  }
}