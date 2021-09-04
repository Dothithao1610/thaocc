import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';

class LabelAccount extends StatelessWidget {
  const LabelAccount({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 7,
          bottom: 7,
          left: CusMargin,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      // color: Colors.green,
    );
  }
}
