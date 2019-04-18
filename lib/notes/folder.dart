import 'package:flutter/material.dart';

class Folder extends StatelessWidget {
  final String widgetType;
  final int index;
  final double heightFactor;
  final double widthFactor;
  final String folderName;
  final Icon addIcon;
  final double iconSize;
  final Icon folderIcon;
  Folder({
    Key key,
    this.widgetType,
    this.index,
    this.heightFactor,
    this.widthFactor,
    this.folderName,
    this.addIcon,
    this.iconSize,
    this.folderIcon
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
          borderRadius: BorderRadius.circular(15.0),
          child: Center(
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
                          folderIcon != null
                          ? folderIcon
                          : Icon(
                            Icons.folder,
                            color: Colors.yellow[600],
                            size: iconSize
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Text(
                              folderName == null ? "Folder" : folderName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                      child: addIcon == null ? Text('') : Icon(Icons.add),
                    )
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}