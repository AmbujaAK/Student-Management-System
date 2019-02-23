import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

import 'frontWidget.dart';
import 'innerTopWidget.dart';
import 'innerBottomWidget.dart';

class AnnouncementItem extends StatefulWidget {
  @override
  _AnnouncementItemState createState() => _AnnouncementItemState();
}

class _AnnouncementItemState extends State<AnnouncementItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: SimpleFoldingCell(
        frontWidget: FrontWidget(),
        innerTopWidget: InnerTopWidget(),
        innerBottomWidget: InnerBottomWidget(),

        cellSize: Size(MediaQuery.of(context).size.width, 175),
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}