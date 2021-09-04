import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';

class MyTimePicker extends StatelessWidget {
  const MyTimePicker({Key key, this.time, this.selectTime}) : super(key: key);

  final TimeOfDay time;
  final Function selectTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.248,
      height: size.height * 0.08,
      margin: EdgeInsets.only(
        top: 1.8 * size.height / 100,
        bottom: 1.3 * size.height / 100,
      ),
      // color: kBackgroundBtnColor,
      child: ElevatedButton(
        onPressed: selectTime,
        child: Text(
          "${time.hour} : ${time.minute}",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.049,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kBackgroundBtnColor),
        ),
      ),
    );
  }
}
