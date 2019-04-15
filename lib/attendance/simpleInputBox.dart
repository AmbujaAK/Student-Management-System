import 'package:flutter/material.dart';

class SimpleInputBox extends StatefulWidget {
  final String boxName;
  final TextEditingController input ;
  final Icon icon;
  SimpleInputBox({Key key,this.boxName,this.input,this.icon});

  @override
  _SimpleInputBoxState createState() => _SimpleInputBoxState();
}

class _SimpleInputBoxState extends State<SimpleInputBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: widget.input,
      decoration: InputDecoration(
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
