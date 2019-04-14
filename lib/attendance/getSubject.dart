import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class GetSubjects extends StatefulWidget {
  final String boxName;
  final String url;
  final TextEditingController input ;
  final Icon icon;
  final String department;
  final String year;
  final String semester;
  GetSubjects({
    Key key,
    this.boxName,
    this.url,
    this.input,
    this.icon,
    this.department,
    this.year,
    this.semester
    });

  @override
  _GetSubjectsState createState() => _GetSubjectsState();
}

class _GetSubjectsState extends State<GetSubjects> {
_showButtonDialog(BuildContext context,String url){
  Future<List> getData() async{
    final response = await http.post(url , body:{
      "department" : widget.department,
      "year" : widget.year,
      "semester" : widget.semester
    });
    
    return json.decode(response.body);
  }
  showDialog(
    context: context,
    builder: (BuildContext context){
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          height: 350.0,
          width: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: FutureBuilder<List>(
            future: getData(),
            builder: (context, index){
              if(index.hasError)
                print("error !!");
              if(index.hasData)
                return DialogItem(list :index.data,input: widget.input,);
              else
                return Center(child: CircularProgressIndicator()); 
            },
          ),
        ),
      );
    }
  );
}

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: widget.input,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              _showButtonDialog(context,widget.url);
            },
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ),
        ),

        prefixIcon: Padding(
          padding: EdgeInsets.all(2.0),
          child: widget.icon
        ),
        labelText: widget.boxName,
        hintText: widget.boxName,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      )
    );
  }
}

class DialogItem extends StatefulWidget {
  final TextEditingController input;
  final List list;
  DialogItem({Key key, this.list,this.input}):super(key:key);
 
  @override
  _DialogItemState createState() => _DialogItemState();
}

class _DialogItemState extends State<DialogItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list==null ? 0 : widget.list.length,
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){
            setState(() {
             widget.input.text = widget.list[index]['subject_name'];
             Navigator.pop(context);
            });
          },
          child: ListTile(
            title: Text(widget.list[index]['subject_name']),
          ),
        );
      },
    );
  }
}
