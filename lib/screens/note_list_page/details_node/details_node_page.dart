import 'package:flutter/material.dart';
import 'package:techsol_ecopark/apis/ApiService.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/functions.dart';
import 'package:techsol_ecopark/models/node.dart';
import 'package:techsol_ecopark/screens/note_list_page/details_node/row_of_gate.dart';
import 'package:techsol_ecopark/screens/note_list_page/edit_gate_page/edit_gate_page.dart';
import 'package:techsol_ecopark/templates/back_button_1.dart';

class DetailsNodePage extends StatefulWidget {
  const DetailsNodePage({Key key, this.node, this.editNode}) : super(key: key);

  final Node node;
  final Function editNode;

  @override
  _DetailsNodePageState createState() => _DetailsNodePageState();
}

class _DetailsNodePageState extends State<DetailsNodePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _switchGateStatus(int gateid) async {
      setState(() {
        if (widget.node.listPump[gateid] == 0)
          widget.node.listPump[gateid] = 1;
        else
          widget.node.listPump[gateid] = 0;
      });

      Functions.showLoading("loading", "Đang điều khiển");
      var status = await ApiService.controlNode(widget.node);
      Functions.showLoading("dismiss", "");
      if (status)
        widget.editNode(widget.node);
      else {
        Functions.showLoading("error", "Không thể điều khiển cổng");
        setState(() {
          if (widget.node.listPump[gateid] == 0)
            widget.node.listPump[gateid] = 1;
          else
            widget.node.listPump[gateid] = 0;
        });
      }
    }

    void _setTiming(Node node, int gateId) async {
      Functions.showLoading("loading", "Đang cài đặt thời gian");
      var status =
          await ApiService.setTiming(node.id, gateId, node.timing[gateId]);
      Functions.showLoading("dismiss", "");
      if (status) {
        setState(() {
          widget.editNode(node);
        });
      } else {
        Functions.showLoading("error", "Không thể cài đặt thời gian");
      }
    }

    void _gotoSetTiming(int id) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditGatePage(
            node: widget.node,
            gateId: id,
            setTiming: _setTiming,
          ),
        ),
      );
    }

    //void _chana

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(alignment: Alignment.topLeft, child: BackButton1()),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Thông tin " + widget.node.name,
                  style: TextStyle(
                    color: kBackgroundBtnColor,
                    fontSize: size.width * 0.056,
                    fontFamily: "Lato",
                  ),
                ),
              ),
            ]..addAll(widget.node.listPump
                .asMap()
                .map(
                  (i, e) {
                    try {
                      return MapEntry(
                        i,
                        RowOfGate(
                          nodeid: widget.node.id,
                          id: i,
                          status: widget.node.listPump[i] == 1,
                          onSwitch: _switchGateStatus,
                          timing: widget.node.timing[i],
                          gotoSetTiming: () => _gotoSetTiming(i),
                        ),
                      );
                    } catch (err) {
                      return MapEntry(
                        i,
                        RowOfGate(
                          nodeid: widget.node.id,
                          id: i,
                          status: widget.node.listPump[i] == 1,
                          onSwitch: _switchGateStatus,
                          timing: [],
                          gotoSetTiming: () => _gotoSetTiming(i),
                        ),
                      );
                    }
                  },
                )
                .values
                .toList()),
          ),
        ),
      ),
    );
  }
}
