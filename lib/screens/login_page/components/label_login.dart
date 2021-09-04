import 'package:flutter/material.dart';

class LabelLogIn extends StatelessWidget {
  const LabelLogIn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var width = size.width;
    // print(width);

    return Container(
      width: size.width,
      height: size.height / 14,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Text(
          "Đăng nhập vào hệ thống",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: "Lato",
            // fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      color: Colors.blueAccent,
    );
  }
}
