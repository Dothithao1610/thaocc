import 'package:flutter/material.dart';

import '../../../constants.dart';

class CurrentUser extends StatelessWidget {
  const CurrentUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("${size.height}");

    return Container(
      width: size.width,
      height: size.height * 0.23,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background2.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: CusMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\nSeungri\n",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.07,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Trạng thái gần nhất",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.06,
                    fontFamily: "Lato",
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: size.width * 0.18,
            height: size.width * 0.18,
            margin: EdgeInsets.only(
              right: CusMargin + 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.09),
              color: Color(0xFFE5E9F2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image(
                image: AssetImage("assets/images/Icon_Smile.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}