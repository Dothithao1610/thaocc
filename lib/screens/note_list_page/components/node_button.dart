import 'package:flutter/material.dart';
import 'package:techsol_ecopark/screens/note_list_page/details_node/details_node_page.dart';

import 'my_switch.dart';

class NodeButton extends StatelessWidget {
  const NodeButton({
    Key key,
    @required this.widget,
    @required this.size,
  }) : super(key: key);

  final MySwitch widget;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // Vì nhét 2 Text vào đây nên 2 Text bị dính vào nhau
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsNodePage(),
          ),
        );
      },
      // style: ButtonStyle(
      //   backgroundColor: MaterialStateProperty.all(Colors.green),
      // ),
      child: Row(
        children: [
          Align(
            child: Text(
              "${widget.nameNode}",
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.053,
                fontFamily: "Lato",
              ),
            ),
            alignment: Alignment.topLeft,
          ), // Label "Node i"
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "ID, tọa độ, trạng thái",
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.044,
                fontFamily: "Lato",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
