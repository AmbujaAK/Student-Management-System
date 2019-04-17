import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

import 'frontWidget.dart';
import 'innerTopWidget.dart';
import 'innerBottomWidget.dart';

class AnnouncementItem extends StatefulWidget {
  final List list;
  AnnouncementItem({
    Key key,
    this.list,
  });

  @override
  _AnnouncementItemState createState() => _AnnouncementItemState();
}

class _AnnouncementItemState extends State<AnnouncementItem> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list == null ? 0: widget.list.length,
      itemBuilder: (context,index){
        return Container(
          child: SimpleFoldingCell(
            frontWidget: FrontWidget(eventDay: widget.list[index]['event_day'],eventTime: widget.list[index]['event_time'], eventDate: widget.list[index]['event_date'],subject: widget.list[index]['subject'],location: widget.list[index]['location'],priority: widget.list[index]['priority'],),
            innerTopWidget: InnerTopWidget(details: widget.list[index]['detail'],),
            innerBottomWidget: InnerBottomWidget(authorName: widget.list[index]['author']),

            cellSize: Size(MediaQuery.of(context).size.width, 120),
            padding: EdgeInsets.all(10.0),
          ),
        );
      },
    ); 
  }
}