import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'dialogItem.dart';

class DialogButton extends StatefulWidget {
  final String btnName;
  final List list;
  final String url;
  DialogButton({Key key, this.btnName, this.list, this.url});

  @override
  _DialogButtonState createState() => _DialogButtonState();
}

class _DialogButtonState extends State<DialogButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(20.0),
      color: Colors.white,
      onPressed: (){
        _showButtonDialog(context,widget.url);
      },
      child: Text(widget.btnName),
    );
  }
}

_showButtonDialog(BuildContext context,String url){
  Future<List> getData() async{
    final response = await http.get(url);
    
    return json.decode(response.body);
  }
  showDialog(
    context: context,
    builder: (BuildContext context){
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
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
                return DialogItem(list :index.data);
              else
                return Center(child: CircularProgressIndicator()); 
            },
          ),
        ),
      );
    }
  );
}
