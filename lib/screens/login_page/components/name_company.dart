import 'package:flutter/material.dart';

class NameCompany extends StatelessWidget {
  const NameCompany({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height / 4.5,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(left: 15),
          child: Text(
            "TECHSOL_ECOPARK",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Lato",
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      // color: Colors.green,
    );
  }
}
