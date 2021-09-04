import 'package:flutter/material.dart';

import '../../../constants.dart';

class ItemOfNavBar extends StatelessWidget {
  const ItemOfNavBar({
    Key key,
    this.image,
    this.title,
    this.press,
  }) : super(key: key);

  final String image;
  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        left: CusPadding,
        right: CusPadding,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset(
              image,
              color: Colors.white,
            ),
            onPressed: press,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.034,
              fontFamily: "Lato",
            ),
          ),
        ],
      ),
    );
  }
}