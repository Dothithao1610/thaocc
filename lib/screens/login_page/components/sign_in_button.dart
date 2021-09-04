import 'package:flutter/material.dart';
import 'package:techsol_ecopark/apis/ApiService.dart';
import 'package:techsol_ecopark/screens/main_page/main_screen.dart';

import '../../../constants.dart';

class SignInButton extends StatelessWidget {
  final Function loginFunction;

  SignInButton({this.loginFunction});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        bottom: size.height * 0.01,
      ),
      child: TextButton(
        onPressed: loginFunction,
        child: Text(
          "ĐĂNG NHẬP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
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
