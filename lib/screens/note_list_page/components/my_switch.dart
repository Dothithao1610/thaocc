import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'cancel_button.dart';
import 'node_button.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({
    Key key,
    this.nameNode,
  }) : super(key: key);

  final String nameNode;

  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print("${widget.nameNode} is On");
    } else {
      setState(() {
        isSwitched = false;
      });
      print("${widget.nameNode} is Off");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      // color: Colors.green,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      child: Row(
        children: [
          NodeButton(widget: widget, size: size), // ID, tọa độ, trạng thái
          Container(
            width: size.width * 0.18,
            height: size.width * 0.1,
            margin: EdgeInsets.only(
              left: CusPadding - 5,
            ),
            child: Switch(
              onChanged: toggleSwitch,
              value: isSwitched,
            ),
          ), // Switch Button
          CancelButton(), // Cancel Button
        ],
      ),
    );
  }
}
