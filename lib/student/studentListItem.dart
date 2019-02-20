import 'package:flutter/material.dart';
import 'studentDetails.dart';

class StudentListItem extends StatelessWidget {
  final List list;
  final int index;
  StudentListItem({Key key, this.list, this.index}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list ==null ? 0 :list.length,
      itemBuilder: (context, index){
        return Hero(
          tag: list[index]['student_id'],
          child: Card(
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
                    builder: (BuildContext context) => StudentDetails(list: list,index: index),
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