import 'package:flutter/material.dart';
import 'package:techsol_ecopark/models/node.dart';

import '../../../constants.dart';
import 'cancel_button.dart';
import 'node_button.dart';

class MyNode extends StatelessWidget {
  const MyNode({
    Key key,
    this.node,
    this.gotoDetails,
  }) : super(key: key);

  final Node node;
  final Function gotoDetails;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        gotoDetails(node);
      },
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  node.name.toUpperCase(),
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(node.description),
              ],
            ),
            //Text("Trạng thái: "),
            Container(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: node.listPump
                  .asMap()
                  .map((i, e) => MapEntry(
                      i,
                      Column(
                        children: [
                          Text((i + 1).toString()),
                          Text(
                            e == 0 ? 'OFF' : 'ON',
                            style: TextStyle(
                              color: e == 0 ? Colors.red : Colors.green,
                            ),
                          ),
                        ],
                      )))
                  .values
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
