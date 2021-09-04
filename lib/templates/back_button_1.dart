import 'package:flutter/material.dart';

class BackButton1 extends StatelessWidget {
  const BackButton1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return IconButton(
      icon: Image.asset(
        "assets/images/Back2.png",
        height: size.width * 0.078,
        width: size.width * 0.078,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}