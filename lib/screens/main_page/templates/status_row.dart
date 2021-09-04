import 'package:flutter/material.dart';

import '../../../constants.dart';

class StatusRow extends StatelessWidget {
  const StatusRow({
    Key key,
    @required this.size,
    this.title,
    this.myHeight,
    this.myWidth,
  }) : super(key: key);

  final Size size;
  final String title;
  final double myHeight;
  final double myWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // height: size.height * 0.075,
      height: myHeight,
      // width: size.width * 0.7,
      width: myWidth,
      margin: EdgeInsets.symmetric(
        vertical: CusPadding + 3,
      ),
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: CusPadding - 3,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.045,
                fontFamily: "Lato",
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: CusPadding - 3,
                right: CusPadding - 3,
                bottom: CusPadding - 2.5,
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                readOnly: true,
                onChanged: (value) {},
                style: TextStyle(
                  fontSize: size.width * 0.045,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
