import 'package:flutter/material.dart';

import '../../../constants.dart';

class InputCodeVeri extends StatelessWidget {
  const InputCodeVeri({
    Key key,
    this.onChanged,
    this.wid,
    this.hei,
    this.fontSi,
    this.marBottom,
  }) : super(key: key);

  final Function onChanged;
  final double wid;
  final double hei;
  final double fontSi;
  final double marBottom;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("${size.height}");

    return Container(
      // width: size.width * 0.78,
      // height: size.height * 0.094,
      width: wid,
      height: hei,
      color: kBackgroundBtnColor,
      margin: EdgeInsets.only(
        // bottom: CusMargin + 15,
        bottom: marBottom,
      ),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: CusPadding - 3,
          ),
        ),
        style: TextStyle(
          // fontSize: size.width * 0.0625,
          fontSize: fontSi,
        ),
        onChanged: (value) {
          onChanged(value);
        },
        textAlignVertical: TextAlignVertical.top,
        // textAlign: TextAlign.center,
      ),
    );
  }
}
