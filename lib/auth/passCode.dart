import 'package:flutter/material.dart';
import 'package:passcode/passcode.dart';

class PassCode extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 160.0,
              child: PasscodeTextField(
              onTextChanged: (passcode) {
                print(passcode);
              },
              totalCharacters: 4,
              borderColor: Colors.black,
              passcodeType: PasscodeType.number,
            ),
          ),
          new Divider(color: Colors.red,indent: 0.0,),
          Container(
            height: 464.0,
            color: Colors.greenAccent,
          )
        ],
      ),
    );
  }
}