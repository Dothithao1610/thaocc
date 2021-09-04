import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/screens/new_password/components/accept_button.dart';
import 'package:techsol_ecopark/screens/new_password/components/input_field.dart';
import 'package:techsol_ecopark/templates/back_button_1.dart';

import 'label_in_create_account.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({Key key}) : super(key: key);

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
                child: Text(
                  "Tạo tài khoản mới\n",
                  style: TextStyle(
                    color: kBackgroundBtnColor,
                    fontSize: size.width * 0.068,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                  ),
                ), //header
              ),

              LabelInCA(
                size: size,
                title: "Tên tài khoản :",
              ), // Tên tài khoản
              Center(
                child: InputCodeVeri(
                  wid: size.width * 0.84,
                  hei: size.height * 0.08,
                  fontSi: size.width * 0.06,
                  marBottom: CusPadding,
                ),
              ),

              LabelInCA(
                size: size,
                title: "Gmail :",
              ), // Gmail
              Center(
                child: InputCodeVeri(
                  wid: size.width * 0.84,
                  hei: size.height * 0.08,
                  fontSi: size.width * 0.05,
                  marBottom: CusPadding,
                ),
              ),

              LabelInCA(
                size: size,
                title: "Khu vực nơi ở :",
              ), // Khu vực nơi ở
              Center(
                child: InputCodeVeri(
                  wid: size.width * 0.84,
                  hei: size.height * 0.08,
                  fontSi: size.width * 0.05,
                  marBottom: CusPadding,
                ),
              ),

              LabelInCA(
                size: size,
                title: "Mật khẩu :",
              ), // Mật khẩu
              Center(
                child: InputCodeVeri(
                  wid: size.width * 0.84,
                  hei: size.height * 0.08,
                  fontSi: size.width * 0.05,
                  marBottom: CusPadding,
                ),
              ),

              LabelInCA(
                size: size,
                title: "Xác nhận mật khẩu :",
              ), // Xác nhận mật khẩu
              Center(
                child: InputCodeVeri(
                  wid: size.width * 0.84,
                  hei: size.height * 0.08,
                  fontSi: size.width * 0.05,
                  marBottom: CusPadding,
                ),
              ),

              Container(
                child: AcceptButton(),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  vertical: CusMargin,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CreateNewAccount fromMap(data) {}
}
