import 'package:flutter/material.dart';

import '../../../constants.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: CusPadding,
      ),
      child: IconButton(
        icon: Image.asset("assets/images/Cancel2.png"),
        onPressed: () async {
          final ConfirmAction action = await _asyncConfirmDialog(context);
          print("Confirm Action $action");
        },
      ),
    );
  }
}

enum ConfirmAction {Cancel, Accept}
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  Size size = MediaQuery.of(context).size;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            "Bạn có muốn xóa Node ?",
            style: TextStyle(
              fontSize: size.width * 0.048,
              fontFamily: "Lato",
            ),
          ),
        ),
        backgroundColor: Color(0xFFA5D9F0),
        actions: [
          ButtonInAlertDialog(
            size: size,
            text: "Không",
          ),
          ButtonInAlertDialog(
            size: size,
            text: "Có",
          ),
        ],
      );
    },
  );
}

class ButtonInAlertDialog extends StatelessWidget {
  const ButtonInAlertDialog({
    Key key,
    @required this.size,
    this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.07,
      color: Colors.white,
      margin: EdgeInsets.only(
        right: CusMargin + 15,
        bottom: CusMargin,
      ),
      child: TextButton(
        onPressed: () {
          Navigator
              .of(context)
              .pop(ConfirmAction.Cancel);
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: size.width * 0.048,
            fontFamily: "Lato",
          ),
        ),
        style: ButtonStyle(

        ),
      ),
    );
  }
}

// Container(
//   width: size.width * 0.2,
//   height: size.height * 0.07,
//   color: Colors.white,
//   margin: EdgeInsets.only(
//     right: CusMargin + 15,
//     bottom: CusMargin,
//   ),
//   child: TextButton(
//     onPressed: () {
//       Navigator
//           .of(context)
//           .pop(ConfirmAction.Accept);
//     },
//     child: Text(
//       "Có",
//       style: TextStyle(
//         color: Colors.black,
//         fontSize: size.width * 0.048,
//         fontFamily: "Lato",
//       ),
//     ),
//   ),
// ),