import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/screens/new_password/components/accept_button.dart';
import 'package:techsol_ecopark/screens/new_password/components/input_field_password.dart';
import 'package:techsol_ecopark/screens/new_password/components/label_new_password.dart';
import 'package:techsol_ecopark/templates/back_button_1.dart';

class AddSubAccountPage extends StatelessWidget {
  const AddSubAccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("${size.height}");

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton1(),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  // top: CusMargin,
                  // bottom: CusMargin + 10,
                  // left: size.height / 6,
                  top: 9 * size.height / 320,
                  bottom: 3 * size.height / 64,
                ),
                child: Text(
                  "THÊM USER",
                  style: TextStyle(
                    color: kBackgroundBtnColor,
                    fontSize: size.width * 0.057,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              LabelNewPw(
                size: size,
                title: "Tên tài khoản",
              ),
              InputFieldPw(size: size),
              LabelNewPw(
                size: size,
                title: "Mật khẩu",
              ),
              InputFieldPw(size: size),
              LabelNewPw(
                size: size,
                title: "Xác nhận mật khẩu",
              ),
              InputFieldPw(size: size),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 3 * size.height / 160,
                ),
                child: AcceptButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
