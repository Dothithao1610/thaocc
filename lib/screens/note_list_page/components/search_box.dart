import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: CusMargin + 5,
        bottom: CusMargin + 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.7,
            height: size.height * 0.08,
            decoration: BoxDecoration(
              color: kBackgroundBtnColor,
            ),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Tìm kiếm Node",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.057,
                  fontFamily: "Lato",
                ),
                contentPadding: EdgeInsets.all(CusPadding),
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.057,
              ),
            ),
          ),
          IconButton(
            icon: Image.asset(
              "assets/images/Search.png",
              color: kBackgroundBtnColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}