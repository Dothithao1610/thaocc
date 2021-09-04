import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/screens/new_password/new_password_page.dart';
import 'package:techsol_ecopark/templates/back_button_1.dart';

import 'components/accept_button.dart';
import 'components/input_field.dart';

class VerifyPage extends StatelessWidget {
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
                heightFactor: 1.5,
                child: Column(
                  children: [
                    Text(
                      "\nNhập mã xác nhận\n",
                      style: TextStyle(
                        color: kBackgroundBtnColor,
                        fontSize: size.width * 0.065,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold,
                      ),
                    ), // Nhãn Nhập mã xác nhận
                    Text(
                      "Gửi mã xác nhận vào gmail\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.056,
                        fontFamily: "Lato",
                      ),
                    ), // Nhãn Gửi xác nhận vào gmail
                    InputCodeVeri(
                      wid: size.width * 0.78,
                      hei: size.height * 0.094,
                      fontSi: size.width * 0.0625,
                      marBottom: CusMargin + 15,
                    ), // Ô Nhập mã xác nhận
                    AcceptButton(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewPasswordPage()),
                        );
                      },
                    ), // Nút xác nhận
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
