import 'package:flutter/material.dart';
import 'package:techsol_ecopark/app_data.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/screens/main_page/templates/status_row.dart';

class MyStatusPage extends StatelessWidget {
  const MyStatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  vertical: CusMargin + 10,
                ),
                child: Text(
                  "TRẠNG THÁI HỆ THỐNG",
                  style: TextStyle(
                    color: kBackgroundBtnColor,
                    fontSize: size.width * 0.048,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: size.height * 0.65,
                width: size.width,
                color: kBackgroundBtnColor,
                child: Column(
                  children: [
                    // Container(
                    //   color: Colors.white,
                    //   width: size.width * 0.89,
                    //   height: size.height * 0.08,
                    //   margin: EdgeInsets.symmetric(
                    //     vertical: CusPadding,
                    //   ),
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: CusPadding,
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "Gateway:",
                    //         style: TextStyle(
                    //           fontSize: size.width * 0.048,
                    //           fontFamily: "Lato",
                    //         ),
                    //       ),
                    //       TextField(
                    //
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    StatusRow(
                      size: size,
                      title: "Gateway: " +
                          (AppData.status.gateway == false
                              ? "DISCONNECTED"
                              : "CONNECTED"),
                      myHeight: size.height * 0.08,
                      myWidth: size.width * 0.89,
                    ),
                    StatusRow(
                      size: size,
                      title: "Áp lực không khí: " +
                          AppData.status.pressure.toString(),
                      myHeight: size.height * 0.08,
                      myWidth: size.width * 0.89,
                    ),
                    StatusRow(
                      size: size,
                      title: "Độ ẩm: " + AppData.status.humidity.toString(),
                      myHeight: size.height * 0.08,
                      myWidth: size.width * 0.89,
                    ),
                    StatusRow(
                      size: size,
                      title:
                          "Nhiệt độ: " + AppData.status.temp.toStringAsFixed(2),
                      myHeight: size.height * 0.08,
                      myWidth: size.width * 0.89,
                    ),
                    StatusRow(
                      size: size,
                      title: "Sức gió: " + AppData.status.wind.toString(),
                      myHeight: size.height * 0.08,
                      myWidth: size.width * 0.89,
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
