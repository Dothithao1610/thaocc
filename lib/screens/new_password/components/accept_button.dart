import 'package:flutter/material.dart';

import '../../../constants.dart';

class AcceptButton extends StatelessWidget {
  const AcceptButton({
    Key key,
    this.press,
  }) : super(key: key);

  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: TextButton(
        onPressed: press,
        child: Text(
          "Xác nhận",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.065,
            fontFamily: "Lato",
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: kBackgroundBtnColor,
        ),
      ),
    );
  }
}