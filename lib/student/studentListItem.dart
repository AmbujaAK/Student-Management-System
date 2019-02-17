import 'package:flutter/material.dart';
import 'studentDetails.dart';

class StudentListItem extends StatelessWidget {
  final List list;

  StudentListItem({Key key, this.list}):super(key:key);

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
                child: Image.network(list[index]['img_url'])
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