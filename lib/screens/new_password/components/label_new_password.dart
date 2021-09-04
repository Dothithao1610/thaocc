import 'package:flutter/material.dart';

class LabelNewPw extends StatelessWidget {
  const LabelNewPw({
    Key key,
    @required this.size,
    this.title,
  }) : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: size.width * 0.05,
        fontFamily: "Lato",
      ),
    );
  }
}