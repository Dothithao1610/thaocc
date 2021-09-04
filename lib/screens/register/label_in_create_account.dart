import 'package:flutter/material.dart';

class LabelInCA extends StatelessWidget {
  const LabelInCA({
    Key key,
    @required this.size,
    this.title,
  }) : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: size.width * 0.08
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: size.width * 0.057,
          fontFamily: "Lato",
        ),
      ),
    );
  }
}