import 'package:flutter/material.dart';
import 'facultyDetails.dart';

class FacultyListItem extends StatelessWidget {
  final List list;

  FacultyListItem({Key key, this.list}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list ==null ? 0 :list.length,
      itemBuilder: (context, index){
        return Hero(
          tag: list[index]['faculty_id'],
          child: Card(
            elevation: 1.0,
            child: ListTile(
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  image: DecorationImage(
                    image: NetworkImage(list[index]['img_url']),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
              title: Text(list[index]['fname'] + " " +list[index]['lname']),
              subtitle: Text(list[index]['email']),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => FacultyDetails(list: list,index: index),
                  )
                );
              },
            ),
          ),
        );
      },
    );
  }
}