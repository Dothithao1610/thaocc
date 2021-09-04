import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/screens/account_page/my_account_page.dart';
import 'package:techsol_ecopark/screens/note_list_page/my_note_list_page.dart';
import 'package:techsol_ecopark/screens/status_page/my_status_page.dart';

import 'components/body.dart';

// class MainPageScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Body(),
//       bottomNavigationBar: MyBotNavbarStful(),
//     );
//   }
// }

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key key}) : super(key: key);

  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  int selectedIndex = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Book.png",
              width: size.width * 0.1,
              color: Colors.white,
            ),
            label: "Note list",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Star.png",
              width: size.width * 0.1,
              color: Colors.white,
            ),
            label: "Trạng thái",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Person1.png",
              width: size.width * 0.1,
              color: Colors.white,
            ),
            label: "Tài khoản",
          ),
        ],
        backgroundColor: kBackgroundBtnColor,
        onTap: onTapHandler,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          fontFamily: "Lato",
        ),
        currentIndex: selectedIndex,
      ),
    );
  }
  Widget getBody() {
    if (selectedIndex == 0 && count == 0) {
      count++;
      print("count = $count");
      print("selectedIndex = $selectedIndex");
      return Body();
    }
    else if (selectedIndex == 0 && count > 0) {
      print("count = $count");
      print("selectedIndex = $selectedIndex");
      return MyNotelistPage();
    }
    else if (selectedIndex == 1) {
      print("selectedIndex = $selectedIndex");
      return MyStatusPage();
    }
    print("selectedIndex = $selectedIndex");
    return MyAccountPage();
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
      // count++;
    });
  }
}

// bottomNavigationBar: Container(
//   height: 70,
//   decoration: BoxDecoration(
//     image: DecorationImage(
//       image: AssetImage("assets/images/background2.jpeg"),
//       fit: BoxFit.cover,
//     ),
//     boxShadow: [
//       BoxShadow(
//         offset: Offset(0, -10),
//         blurRadius: 35,
//         color: kBackgroundBtnColor.withOpacity(0.38),
//       ),
//     ],
//   ),
//   child: Row(
//     children: [
//       ItemOfNavBar(
//         image: "assets/images/Book.png",
//         title: "Node list",
//         press: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => MyNotelistPage(),
//               ),
//           );
//         },
//       ),
//       Spacer(),
//       ItemOfNavBar(
//         image: "assets/images/Star.png",
//         title: "Trạng thái",
//       ),
//       Spacer(),
//       ItemOfNavBar(
//         image: "assets/images/Person1.png",
//         title: "Tài khoản",
//       ),
//     ],
//   ),
// ),
