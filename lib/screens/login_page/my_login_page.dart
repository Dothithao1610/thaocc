import 'package:flutter/material.dart';
import 'package:techsol_ecopark/apis/ApiService.dart';
import 'package:techsol_ecopark/app_data.dart';
import 'package:techsol_ecopark/functions.dart';
import 'package:techsol_ecopark/screens/main_page/main_screen.dart';

import '../../constants.dart';
import 'components/forgot_button.dart';
import 'components/input_field.dart';
import 'components/label_account.dart';
import 'components/label_login.dart';
import 'components/name_company.dart';
import 'components/sign_in_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Biến chứa tên người dùng
    String userName = "adminngoc";
    // Biến chứa nội dung mật khẩu
    String passWord = "123456";

    // Cần sử dụng hai hàm này để update giá trị trong hai biến trên khi
    //    người dùng thay đổi nội dung trong hai ô nhập text.
    // Sau đó phải truyền hai hàm này vào từng component tương ứng
    void onChangePassword(String newValue) {
      passWord = newValue;
    }

    void onChangeUsername(String newValue) {
      userName = newValue;
    }

    // Khai báo hàm đăng nhập ở bên ngoài component chính.
    //   Sau đó truyền vào component nút nhấn SignIn
    void login() async {
      Functions.showLoading('loading', "Đang đăng nhập");
      var user = await ApiService.login(userName, passWord);
      if (user != null) {
        // Đăng nhập thành công -> Mở page tiếp theo
        user.password = passWord;
        AppData.user = user;

        var status = await ApiService.getSystemStatus();
        if (status == null) {
        } else {
          AppData.status = status;
        }
        Functions.showLoading('dismiss', "");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainPageScreen(),
          ),
        );
      } else {
        // Thông báo đăng nhập thất bại
        Functions.showLoading('error', "Sai tên đăng nhập hoặc mật khẩu");
      }
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_main.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              NameCompany(),
              LabelLogIn(),
              Container(
                color: Color.fromRGBO(255, 255, 255, 0.25),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    LabelAccount(text: "Tên tài khoản"),
                    // Chú ý cách truyền các hàm hoặc biến từ components cha vào các components con như bên dưới
                    InputField(
                      onChangedText: onChangeUsername,
                    ),
                    LabelAccount(text: "Mật khẩu"),
                    InputField(
                      onChangedText: onChangePassword,
                      type: TextInputType.visiblePassword,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: CusPadding,
                      ),
                      child: ForgotButton(),
                    ), //Check Box and Forgot Password
                    SignInButton(
                      loginFunction: login,
                    ), //Button Sign In
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
