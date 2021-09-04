import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techsol_ecopark/apis/ApiService.dart';
import 'package:techsol_ecopark/constants.dart';
import 'package:techsol_ecopark/functions.dart';
import 'package:techsol_ecopark/models/node.dart';
import 'package:techsol_ecopark/screens/note_list_page/add_new_node/add_new_node_page.dart';
import 'package:techsol_ecopark/screens/note_list_page/components/my_node.dart';
import 'package:techsol_ecopark/screens/note_list_page/details_node/details_node_page.dart';

class MyNotelistPage extends StatefulWidget {
  const MyNotelistPage({Key key}) : super(key: key);

  @override
  _MyNotelistPageState createState() => _MyNotelistPageState();
}

class _MyNotelistPageState extends State<MyNotelistPage> {
  List<Node> nodes = [];

  @override
  void initState() {
    Functions.showLoading("loading", "Đang tải dữ liệu");
    ApiService.getListNode().then((values) {
      if (values == null)
        Functions.showLoading("error", "Tải danh sách node thất bại");
      else {
        Functions.showLoading("dismiss", "");
        setState(() {
          nodes = values;
        });
      }
    });

    super.initState();
  }

  void _editNode(Node node) {
    for (int i = 0; i < nodes.length; i++) {
      if (node.id == nodes[i].id) {
        setState(() {
          nodes[i] = node;
        });
      }
    }
  }

  void _detailNode(Node node) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsNodePage(
          node: node,
          editNode: _editNode,
        ),
      ),
    );
  }

  void _addNode(String name, String des, LatLng loca) async {
    print("name: " + name);
    print("des: " + des);

    Functions.showLoading("loading", "Đang thêm node");
    var node = await ApiService.addNode(name, des, loca);
    Functions.showLoading("dismiss", "");
    if (node != null) {
      setState(() {
        setState(() {
          nodes.add(node);
        });
      });
      Navigator.pop(context);
    } else {
      Functions.showLoading("error", "Không thể thêm node mới");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: CusMargin + 5,
                  ),
                  child: Text(
                    "Danh sách node",
                    style: TextStyle(
                      color: kBackgroundBtnColor,
                      fontSize: size.width * 0.066,
                    ),
                  ),
                ), // Label "Note list"
                //SearchBox(size: size), // Search Box
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: size.height * 0.6,
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: kBackgroundBtnColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: nodes
                          .map(
                            (e) => MyNode(
                              node: e,
                              gotoDetails: _detailNode,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.55,
                  height: size.height * 0.08,
                  color: kBackgroundBtnColor,
                  margin: EdgeInsets.symmetric(
                    vertical: CusMargin + 7,
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      print("Clicked Thêm Node Mới");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewNodePage(
                            addNote: _addNode,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      "Thêm Node mới",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.05,
                        fontFamily: "Lato",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
//   height: size.height * 0.1,
//   color: Colors.green,
//   child: Row(
//     children: [
//       Align(
//         child: Text(
//           "Node 1",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: size.width * 0.053,
//             fontFamily: "Lato",
//           ),
//         ),
//         alignment: Alignment.topLeft,
//       ),
//       Align(
//         alignment: Alignment.bottomCenter,
//         child: Text(
//           "ID, tọa độ, trạng thái",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: size.width * 0.044,
//             fontFamily: "Lato",
//           ),
//         ),
//       ),
//       MySwitch(),
//     ],
//   ),
// ),
