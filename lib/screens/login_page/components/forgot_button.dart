import 'package:flutter/material.dart';
import 'package:techsol_ecopark/screens/new_password/verify_page.dart';

import 'my_check_box.dart';

class ForgotButton extends StatelessWidget {
  const ForgotButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print("${size.height}");

    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.015, //10
        bottom: size.height * 0.022, //15
      ),
      child: Row(
        children: <Widget>[
          MyCheckBox(),
          Text(
            "Remember me",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20, //16
              fontFamily: "Lato",
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyPage(),
                  ));
            },
            child: Text(
              "Forgot Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20, //16
                fontFamily: "Lato",
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
