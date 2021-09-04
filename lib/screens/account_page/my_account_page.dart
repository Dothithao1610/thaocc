import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techsol_ecopark/app_data.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/screens/account_page/my_account_page.dart';
import 'package:techsol_ecopark/screens/account_page/chg_name_page/change_name_page.dart';
import 'package:techsol_ecopark/screens/login_page/my_login_page.dart';
import 'package:techsol_ecopark/screens/register/create_new%20_account.dart';

import 'chg_pass_page/change_password_page.dart';
import 'components/my_elevated_button.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.35,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.31,
                    padding: EdgeInsets.only(
                      left: CusMargin + 5,
                      right: CusMargin + 5,
                      top: CusMargin + 15,
                    ),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/background1.jpeg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.6,
                          // color: Colors.yellow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: CusPadding,
                                ),
                                child: Text(
                                  AppData.user.username,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.06,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                AppData.user.email,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.044,
                                  fontFamily: "Lato",
                                ),
                              ),
                              Text(
                                AppData.user.date,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.044,
                                  fontFamily: "Lato",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.178,
                          height: size.width * 0.178,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.09),
                            color: Color(0xFFE5E9F2),
                          ),
                          padding: EdgeInsets.all(CusMargin),
                          child: Image(
                            image: AssetImage("assets/images/Icon_Smile.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: size.height * 0.09,
                      margin: EdgeInsets.symmetric(
                        horizontal: CusPadding * 4,
                      ),
                      color: kBackgroundBtnColor,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Quản lý tài khoản",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.057,
                            fontFamily: "Lato",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MyElevatedButton(
              size: size,
              icon: Icons.edit,
              laBel: "Chỉnh sửa mật khẩu",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordPage(),
                  ),
                );
              },
            ),
            // MyElevatedButton(
            //   size: size,
            //   icon: Icons.edit,
            //   laBel: "Chỉnh sửa tên",
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => CreateNewAccount(),
            //       ),
            //     );
            //   },
            // ),
            // MyElevatedButton(
            //   size: size,
            //   icon: Icons.add,
            //   laBel: "Thêm user",
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => CreateNewAccount(),
            //       ),
            //     );
            //   },
            // ),
            Container(
              width: size.width * 0.3,
              height: size.height * 0.08,
              color: kBackgroundBtnColor,
              margin: EdgeInsets.symmetric(
                vertical: CusPadding,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    (route) => false,
                  );
                },
                child: Text(
                  "Đăng xuất",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.057,
                    fontFamily: "Lato",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  MyAccountPage fromMap(data) {}
}
