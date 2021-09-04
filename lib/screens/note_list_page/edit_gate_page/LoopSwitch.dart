import 'package:flutter/material.dart';

class LoopSwitch extends StatefulWidget {
  const LoopSwitch({Key key}) : super(key: key);

  @override
  _LoopSwitchState createState() => _LoopSwitchState();
}

class _LoopSwitchState extends State<LoopSwitch> {
  bool isSwitched = false;

  void toggleSwitch (bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print("Loop is On !");
    } else {
      setState(() {
        isSwitched = false;
      });
      print("Loop is Off !");
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.18,
      height: size.width * 0.1,
      child: Switch(
        onChanged: toggleSwitch,
        value: isSwitched,
      ),
    );
  }
}
