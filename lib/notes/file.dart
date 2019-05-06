import 'package:flutter/material.dart';

import 'package:open_file/open_file.dart';


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
  final String filePath;

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
    this.currPath,
    this.filePath
  });
  
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    Widget _getIcon(String fileType){
      print('FileType :: $fileType');
      switch (fileType) {
        case 'pdf':
          return Icon(
            Icons.picture_as_pdf,
            color: Colors.red,
            size: 20,
          );
          break;
        case 'jpg':
          return Icon(
            Icons.image,
            color: Colors.green,
            size: 20,
          );
          break;
        case 'jpeg':
          return Icon(
            Icons.image,
            color: Colors.green,
            size: 20,
          );
          break;
        case 'ppt':
          return Icon(
            Icons.slideshow,
            color: Colors.yellow,
            size: 20,
          );
          break;
        default:
          return Icon(
            Icons.broken_image,
            color: Colors.blue,
            size: 20,
          );
      }
    }

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
              onTap: (){
                print('file path :: ');
                print(filePath);
                OpenFile.open(filePath);
              },
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
                            _getIcon(fileType),
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