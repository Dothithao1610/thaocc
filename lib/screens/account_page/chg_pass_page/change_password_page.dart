import 'package:flutter/material.dart';
import 'package:techsol_ecopark/apis/ApiService.dart';
import 'package:techsol_ecopark/app_data.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/functions.dart';
import 'package:techsol_ecopark/screens/new_password/components/accept_button.dart';
import 'package:techsol_ecopark/screens/new_password/components/input_field_password.dart';
import 'package:techsol_ecopark/screens/new_password/components/label_new_password.dart';
import 'package:techsol_ecopark/templates/back_button_1.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController oldStr = new TextEditingController();
  final TextEditingController newStr = new TextEditingController();
  final TextEditingController confirmStr = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _changePassword() async {
      if (oldStr.text != AppData.user.password) {
        Functions.showLoading("error", "Mật khẩu nhập vào không đúng");
      } else if (confirmStr.text != newStr.text) {
        Functions.showLoading("error", "Mật khẩu xác nhận không khớp");
      } else if (newStr.text.length < 6) {
        Functions.showLoading("error", "Mật khẩu phải dài hơn 6 ký tự");
      } else {
        var status = await ApiService.changepassword(oldStr.text, newStr.text);
        if (status) {
          Functions.showLoading("success", "Cập nhật mật khẩu thành công");
          AppData.user.password = newStr.text;
          Navigator.pop(context);
        } else
          Functions.showLoading("error", "Không thể cập nhật mật khẩu.");
      }
    }

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
                  top: CusPadding,
                  bottom: CusMargin + 12,
                ),
                child: Text(
                  "THAY ĐỔI MẬT KHẨU",
                  style: TextStyle(
                    color: kBackgroundBtnColor,
                    fontSize: size.width * 0.057,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelNewPw(
                      size: size,
                      title: "Mật khẩu cũ:",
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: CusMargin + 10,
                      ),
                      child: TextFormField(
                        controller: oldStr,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kBackgroundBtnColor,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: CusPadding,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: size.width * 0.056,
                        ),
                      ),
                    ),
                    LabelNewPw(
                      size: size,
                      title: "Mật khẩu mới:",
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: CusMargin + 10,
                      ),
                      child: TextField(
                        controller: newStr,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kBackgroundBtnColor,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: CusPadding,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: size.width * 0.056,
                        ),
                      ),
                    ),
                    LabelNewPw(
                      size: size,
                      title: "Xác nhận mật khẩu mới:",
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: CusMargin + 10,
                      ),
                      child: TextField(
                        controller: confirmStr,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kBackgroundBtnColor,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: CusPadding,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: size.width * 0.056,
                        ),
                      ),
                    ),
                    AcceptButton(
                      press: () {
                        _changePassword();
                      },
                    ),
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
