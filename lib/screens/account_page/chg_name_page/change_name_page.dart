import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/screens/new_password/components/accept_button.dart';
import 'package:techsol_ecopark/screens/new_password/components/input_field_password.dart';
import 'package:techsol_ecopark/screens/new_password/components/label_new_password.dart';
import 'package:techsol_ecopark/templates/back_button_1.dart';

class ChangeNamePage extends StatelessWidget {
  const ChangeNamePage({Key key}) : super(key: key);

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
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  // top: CusMargin + 8,
                  // bottom: CusMargin + 40,
                  top: 4.4 * size.height / 100,
                  bottom: 33 * size.height / 320,
                ),
                child: Text(
                  "THAY ĐỔI TÊN",
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
                title: "Tên mới:",
              ),
              InputFieldPw(
                size: size,
              ),
              Container(
                margin: EdgeInsets.only(
                  // top: CusMargin + 10,
                  top: 3 * size.height / 64,
                ),
                child: AcceptButton(
                  press: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static ChangeNamePage fromMap(data) {}
}
