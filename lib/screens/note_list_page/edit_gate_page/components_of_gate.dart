import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';

class ComponentsOfGate extends StatelessWidget {
  const ComponentsOfGate({
    Key key,
    this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.09,
      padding: EdgeInsets.symmetric(
        horizontal: CusPadding
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      // color: Colors.yellow,
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.049,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
              ),
              // textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: size.width * 0.6,
            height: size.height * 0.09,
            // padding: EdgeInsets.all(2),
            margin: EdgeInsets.symmetric(horizontal: CusPadding),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: size.width * 0.06,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
