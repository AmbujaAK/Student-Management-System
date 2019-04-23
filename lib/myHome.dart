import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import './nav/bottomNavigation.dart';
class MyHomePage extends StatefulWidget {
  final String userId;
  final String userType;
  MyHomePage({Key key,this.userId,this.userType});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  createDir() async {
    Directory baseDir = await getExternalStorageDirectory(); //only for Android
    
    String dirToBeCreated = "JUSMS";
    String finalDir = join(baseDir.path, dirToBeCreated);
    
    var dir = Directory(finalDir);
    bool dirExists = await dir.exists();
    if(!dirExists){
      dir.create(/*recursive=true*/); //pass recursive as true if directory is recursive
    }else{
      print('created :: $dir');
    }
    //Now you can use this directory for saving file, etc.
    //In case you are using external storage, make sure you have storage permissions.
  }

  @override
  void initState() {
    createDir();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //return Tabs(userId: widget.userId,);
    return BottomNavigation(userType: widget.userType, userId: widget.userId);
  }
}