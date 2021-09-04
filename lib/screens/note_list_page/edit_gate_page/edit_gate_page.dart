import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techsol_ecopark/apis/ApiService.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/models/node.dart';
import 'package:techsol_ecopark/screens/note_list_page/edit_gate_page/components_of_gate.dart';
import 'package:techsol_ecopark/templates/back_button_1.dart';

import 'my_time_picker.dart';
import 'row_of_loop.dart';

class EditGatePage extends StatefulWidget {
  const EditGatePage({Key key, this.node, this.gateId, this.setTiming})
      : super(key: key);

  final Node node;
  final int gateId;
  final Function setTiming;

  @override
  _EditGatePageState createState() => _EditGatePageState();
}

class _EditGatePageState extends State<EditGatePage> {
  TimeOfDay time1 = TimeOfDay(hour: 8, minute: 15);
  TimeOfDay time2 = TimeOfDay(hour: 8, minute: 15);
  TimeOfDay time3 = TimeOfDay(hour: 8, minute: 15);
  TimeOfDay time4 = TimeOfDay(hour: 8, minute: 15);

  void _selectTime1() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: time1,
    );

    if (newTime != null) {
      setState(() {
        time1 = newTime;
      });
    }
  }

  void _selectTime4() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: time4,
    );

    if (newTime != null) {
      setState(() {
        time4 = newTime;
      });
    }
  }

  void _selectTime2() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: time2,
    );

    if (newTime != null) {
      setState(() {
        time2 = newTime;
      });
    }
  }

  void _selectTime3() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: time3,
    );

    if (newTime != null) {
      setState(() {
        time3 = newTime;
      });
    }
  }

  @override
  void initState() {
    if (widget.node.timing[widget.gateId] != null &&
        widget.node.timing[widget.gateId].length > 0) {
      //print(widget.node.timing[widget.gateId]);
      int hour1 = widget.node.timing[widget.gateId][0].startTime ~/ 60;
      int minute1 = widget.node.timing[widget.gateId][0].startTime % 60;
      time1 = TimeOfDay(hour: hour1, minute: minute1);

      int hour2 = widget.node.timing[widget.gateId][0].endTime ~/ 60;
      int minute2 = widget.node.timing[widget.gateId][0].endTime % 60;
      time2 = TimeOfDay(hour: hour2, minute: minute2);

      int hour3 = widget.node.timing[widget.gateId][1].startTime ~/ 60;
      int minute3 = widget.node.timing[widget.gateId][1].startTime % 60;
      time3 = TimeOfDay(hour: hour3, minute: minute3);

      int hour4 = widget.node.timing[widget.gateId][1].endTime ~/ 60;
      int minute4 = widget.node.timing[widget.gateId][1].endTime % 60;
      time4 = TimeOfDay(hour: hour4, minute: minute4);
    }
    super.initState();
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
              Container(
                color: kBackgroundBtnColor,
                child: Row(
                  children: [
                    // Expanded(
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       "Hủy",
                    //       style: TextStyle(
                    //         color: Colors.yellowAccent,
                    //         fontSize: size.width * 0.049,
                    //         fontFamily: "Lato",
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Chỉnh sửa cổng",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.049,
                          fontFamily: "Lato",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Expanded(
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       "Sửa",
                    //       style: TextStyle(
                    //         color: Colors.yellowAccent,
                    //         fontSize: size.width * 0.049,
                    //         fontFamily: "Lato",
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ), //App bar Chỉnh sửa cổng
              Container(
                width: size.width,
                height: size.height * 0.32,
                // color: Colors.green,
                padding: EdgeInsets.symmetric(
                  vertical: CusPadding,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 8.4 * size.height / 100,
                              bottom: 9 * size.height / 160,
                            ),
                            child: Text(
                              "HẸN GIỜ 1",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 0.049,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "HẸN GIỜ 2",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * 0.049,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      flex: 1,
                    ), //Column Hẹn Giờ
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Bắt đầu",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * 0.049,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          MyTimePicker(
                            time: time1,
                            selectTime: _selectTime1,
                          ), //Hẹn giờ bắt đầu 1
                          MyTimePicker(
                            time: time3,
                            selectTime: _selectTime3,
                          ),
                        ],
                      ),
                      flex: 1,
                    ), //Column Bắt đầu
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Kết thúc",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * 0.049,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          MyTimePicker(
                            time: time2,
                            selectTime: _selectTime2,
                          ),
                          MyTimePicker(
                            time: time4,
                            selectTime: _selectTime4,
                          ), //Hẹn giờ kết thúc 2
                        ],
                      ),
                      flex: 1,
                    ), //Column Kết thúc
                  ],
                ),
              ),
              // ComponentsOfGate(
              //   text: "Tên :",
              // ),
              // ComponentsOfGate(
              //   text: "ID :",
              // ),
              // ComponentsOfGate(
              //   text: "Khu vực :",
              // ),
              // ComponentsOfGate(
              //   text: "Trạng thái :",
              // ),
              // RowOfLoop(size: size),
              Center(
                child: Container(
                  width: size.width * 0.405,
                  height: size.height * 0.08,
                  margin: EdgeInsets.symmetric(
                    vertical: 6.5 * size.height / 100,
                  ),
                  color: kBackgroundBtnColor,
                  child: TextButton(
                    onPressed: () {
                      if (widget.node.timing[widget.gateId].length == 0) {
                        widget.node.timing[widget.gateId].add(new Timing(
                          startTime: time1.hour * 60 + time1.minute,
                          endTime: time3.hour * 60 + time3.minute,
                        ));
                        widget.node.timing[widget.gateId].add(new Timing(
                          startTime: time2.hour * 60 + time2.minute,
                          endTime: time4.hour * 60 + time4.minute,
                        ));
                      } else {
                        widget.node.timing[widget.gateId][0].startTime =
                            time1.hour * 60 + time1.minute;

                        widget.node.timing[widget.gateId][0].endTime =
                            time3.hour * 60 + time3.minute;

                        widget.node.timing[widget.gateId][1].startTime =
                            time2.hour * 60 + time2.minute;

                        widget.node.timing[widget.gateId][1].endTime =
                            time4.hour * 60 + time4.minute;
                      }
                      widget.setTiming(widget.node, widget.gateId);
                    },
                    child: Text(
                      "GỬI CÀI ĐẶT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.045,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
