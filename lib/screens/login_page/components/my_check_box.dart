import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {

  bool rememberCheck = false;
  void onRememberMeChanged (bool newValue) {
    setState(() {
      rememberCheck = newValue;

      if (rememberCheck) {
        // TODO: Hàm để nhớ User
      } else {
        // TODO: Hàm để quên User
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: rememberCheck,
      onChanged: onRememberMeChanged,
      // fillColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(Colors.cyanAccent), //Vòng tròn nhô ra khi click
    );
  }
}