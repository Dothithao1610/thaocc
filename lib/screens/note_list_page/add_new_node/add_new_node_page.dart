import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/models/node.dart';
import 'package:techsol_ecopark/screens/new_password/components/accept_button.dart';
import 'package:techsol_ecopark/screens/new_password/components/input_field.dart';
import 'package:techsol_ecopark/screens/register/label_in_create_account.dart';
import 'package:techsol_ecopark/templates/back_button_1.dart';

class AddNewNodePage extends StatefulWidget {
  const AddNewNodePage({Key key, this.addNote}) : super(key: key);

  final Function addNote;

  @override
  _AddNewNodePageState createState() => _AddNewNodePageState();
}

class _AddNewNodePageState extends State<AddNewNodePage> {
  String name;
  String des;
  String lat;
  String lng;

  void _changeName(String value) {
    setState(() {
      name = value;
    });
  }

  void _changeDes(String value) {
    setState(() {
      des = value;
    });
  }

  void _changeLat(String value) {
    setState(() {
      lat = value;
    });
  }

  void _changeLng(String value) {
    setState(() {
      lng = value;
    });
  }

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
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: CusMargin,
                ),
                child: Center(
                  child: Text(
                    "Thêm Node",
                    style: TextStyle(
                      color: kBackgroundBtnColor,
                      fontSize: size.width * 0.057,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              LabelInCA(
                size: size,
                title: "Tên node :",
              ),
              Center(
                child: InputCodeVeri(
                  onChanged: _changeName,
                  wid: size.width * 0.84,
                  hei: size.height * 0.085,
                  fontSi: size.width * 0.057,
                  marBottom: CusMargin + 5,
                ),
              ),
              LabelInCA(
                size: size,
                title: "Mô tả :",
              ),
              Center(
                child: InputCodeVeri(
                  onChanged: _changeDes,
                  wid: size.width * 0.84,
                  hei: size.height * 0.085,
                  fontSi: size.width * 0.057,
                  marBottom: CusMargin + 5,
                ),
              ),
              LabelInCA(
                size: size,
                title: "Kinh độ :",
              ),
              Center(
                child: InputCodeVeri(
                  onChanged: _changeLat,
                  wid: size.width * 0.84,
                  hei: size.height * 0.085,
                  fontSi: size.width * 0.057,
                  marBottom: CusMargin + 15,
                ),
              ),
              LabelInCA(
                size: size,
                title: "Vĩ độ :",
              ),
              Center(
                child: InputCodeVeri(
                  onChanged: _changeLng,
                  wid: size.width * 0.84,
                  hei: size.height * 0.085,
                  fontSi: size.width * 0.057,
                  marBottom: CusMargin + 15,
                ),
              ),
              AcceptButton(
                press: () {
                  lat = "21.542322";
                  lng = "105.8437013";
                  double lats = double.parse(lat);
                  double long = double.parse(lng);

                  widget.addNote(
                    name,
                    des,
                    LatLng(lat: lats, lng: long),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
