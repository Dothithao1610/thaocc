import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/screens/new_password/components/accept_button.dart';
import 'package:techsol_ecopark/templates/back_button_1.dart';

import 'components/input_field_password.dart';
import 'components/label_new_password.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton1(),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: CusMargin,
                  ),
                  child: Text(
                    "Mật khẩu mới\n",
                    style: TextStyle(
                      color: kBackgroundBtnColor,
                      fontSize: size.width * 0.066,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              LabelNewPw(size: size, title: "Mật khẩu mới",),
              InputFieldPw(size: size),
              LabelNewPw(size: size, title: "Xác nhận mật khẩu mới",),
              InputFieldPw(size: size),
              AcceptButton(
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}




