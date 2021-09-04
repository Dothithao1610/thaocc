import 'package:flutter/material.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/functions.dart';
import 'package:techsol_ecopark/models/node.dart';
import 'package:techsol_ecopark/screens/note_list_page/edit_gate_page/edit_gate_page.dart';

class RowOfGate extends StatelessWidget {
  const RowOfGate({
    Key key,
    this.nodeid,
    this.id,
    this.status,
    this.onSwitch,
    this.timing,
    this.gotoSetTiming,
  }) : super(key: key);

  final String nodeid;
  final int id;
  final bool status;
  final Function onSwitch;
  final List<Timing> timing;
  final Function gotoSetTiming;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      //height: size.height * 0.12,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kBackgroundBtnColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextButton(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cổng " + (id + 1).toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.053,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: size.width * 0.18,
                        height: size.width * 0.1,
                        alignment: Alignment.centerRight,
                        child: Switch(
                          value: status,
                          onChanged: (value) {
                            onSwitch(id);
                          },
                        ),
                      ),
                    ],
                  ),
                  timing.length == 0
                      ? Text(
                          "Không có cài đặt hẹn giờ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: size.width * 0.040,
                            fontFamily: "Lato",
                          ),
                        )
                      : Column(
                          children: timing
                              .asMap()
                              .map(
                                (i, e) => MapEntry(
                                  i,
                                  Text(
                                    "Hẹn giờ " +
                                        (i + 1).toString() +
                                        " từ " +
                                        Functions.getTimeString(e.startTime) +
                                        " đến " +
                                        Functions.getTimeString(e.endTime),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.width * 0.040,
                                      fontFamily: "Lato",
                                    ),
                                  ),
                                ),
                              )
                              .values
                              .toList(),
                        ),
                ],
              ),
              onPressed: gotoSetTiming,
            ),
          ),
        ],
      ),
    );
  }
}
