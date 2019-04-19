import 'package:flutter/material.dart';

import 'github/githubProject.dart';
import 'github/githubTrendingProject.dart';
import '../notes/folder.dart';


class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GithubProject(),
                      )
                    );
                  },
                  child: Folder(
                    folderIcon: Icon(Icons.folder,color: Colors.yellow[700],),
                    folderName: "Github",
                    heightFactor: 0.10,
                    widthFactor: 0.45,
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GithubTrendingProject(),
                      )
                    );
                  },
                  child: Folder(
                    folderIcon: Icon(Icons.folder,color: Colors.yellow[700],),
                    folderName: "Trending",
                    heightFactor: 0.10,
                    widthFactor: 0.45,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Folder(
                  folderIcon: Icon(Icons.folder,color: Colors.yellow[700],),
                  folderName: "College",
                  heightFactor: 0.10,
                  widthFactor: 0.45,
                ),
                Folder(
                  folderIcon: Icon(Icons.folder,color: Colors.yellow[700],),
                  folderName: "Workshop",
                  heightFactor: 0.10,
                  widthFactor: 0.45,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}