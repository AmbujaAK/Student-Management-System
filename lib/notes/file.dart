import 'package:flutter/material.dart';

class File extends StatelessWidget {
  final String widgetType;
  final int index;
  final double heightFactor;
  final double widthFactor;
  final String fileName;
  final String fileType;
  final String fileSize;
  final String title;
  final String currPath;

  File({
    Key key,
    this.widgetType,
    this.index,
    this.heightFactor,
    this.widthFactor,
    this.fileName,
    this.fileType,
    this.fileSize,
    this.title,
    this.currPath
  });
  
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,8.0,4.0,4.0),
      child: Container(
        height: _height * (heightFactor == null ? 0.28 : heightFactor ),
        width: _width * (widthFactor == null ? 0.46 : widthFactor),
        child: Material(
          type: MaterialType.card,
          color: Colors.white,
          elevation: 1.0,
          borderRadius: BorderRadius.circular(3.0),
          child: Center(
            child: InkWell(
              onTap: (){},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.picture_as_pdf,
                              color: Colors.red,
                              size: 20.0
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    fileName == null ? "Folder" : fileName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    fileSize,
                                    style: TextStyle(
                                      fontSize: 8.0
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}