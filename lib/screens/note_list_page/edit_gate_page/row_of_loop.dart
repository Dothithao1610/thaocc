import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'LoopSwitch.dart';

class RowOfLoop extends StatelessWidget {
  const RowOfLoop({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.09,
      padding: EdgeInsets.symmetric(
        horizontal: CusPadding,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
          ),
          bottom: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            "Lặp lại :",
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.049,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          LoopSwitch(),
        ],
      ),
    );
  }
}
