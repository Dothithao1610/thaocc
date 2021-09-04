import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';

class MyBotNavbarStful extends StatefulWidget {
  const MyBotNavbarStful({Key key}) : super(key: key);

  @override
  _MyBotNavbarStfulState createState() => _MyBotNavbarStfulState();
}

//Bottom Navigation Bar này chưa cần dùng đến

class _MyBotNavbarStfulState extends State<MyBotNavbarStful> {

  int selectedIndex = 0;

  void onItemTapped (int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BottomNavigationBar(
      backgroundColor: kBackgroundBtnColor,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/Book.png",
            width: size.width * 0.1,
          ),
          label: "Note list",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/Star.png",
            width: size.width * 0.1,
          ),
          label: "Trạng thái",
        ),
        BottomNavigationBarItem(
          // icon: Image.asset(
          //   "assets/images/Person1.png",
          //   width: size.width * 0.1,
          // ),
          icon: Icon(
            Icons.account_circle_outlined
          ),
          label: "Tài khoản",
        ),
      ],
      onTap: onItemTapped,
      selectedItemColor: Colors.black,
    );
  }
  // Widget getBody(){
  //   if (selectedIndex == 0) {
  //     return MyNotelistPage();
  //   }else if (selectedIndex == 1) {
  //     return MyStatusPage();
  //   } else if (selectedIndex == 2) {
  //     return MyAccountPage();
  //   }
  //   return Body();
  // }
}

