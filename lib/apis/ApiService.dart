import 'package:dio/dio.dart';
import 'package:techsol_ecopark/app_data.dart';
import 'package:techsol_ecopark/models/node.dart';
import 'package:techsol_ecopark/models/system_status.dart';
import 'package:techsol_ecopark/models/user.dart';
import 'package:techsol_ecopark/screens/account_page/chg_name_page/change_name_page.dart';
import 'package:techsol_ecopark/screens/account_page/chg_pass_page/change_password_page.dart';
import 'package:techsol_ecopark/screens/account_page/my_account_page.dart';
import 'package:techsol_ecopark/screens/note_list_page/add_new_node/add_new_node_page.dart';
import 'package:techsol_ecopark/screens/note_list_page/edit_gate_page/edit_gate_page.dart';
import 'package:techsol_ecopark/screens/register/create_new%20_account.dart';

class ApiService {
  static String url = 'https://sandbox.aquasoft.vn:30009/';
  static String token = "";

  // hàm đăng nhập
  static Future<User> login(String username, String password) async {
    // Thêm header vào request
    // Từng API sẽ có thể có hoặc không việc thêm header này
    // Đọc kỹ trong API document anh gửi nhé

    // hàm này k yêu cầu để header nên gửi header rỗng như sau
    var headers = <String, String>{
      //"token": token,
    };

    // Dữ liệu gửi lên
    // Tương ứng với dữ liệu trong body mà tài liệu api mô tả
    Map<String, dynamic> body = <String, dynamic>{
      "username": username,
      "password": password,
    };

    // Tên của api
    String apiPath = 'auth/login';

    try {
      var response = await Dio()
          .post(url + apiPath,
              options: new Options(headers: headers), data: body)
          .timeout(Duration(seconds: 10));

      // Dữ liệu được trả về trong biến response.data
      // Dựa vào cấu trúc dữ liệu trả về được mô tả, phân tích và lấy các dữ liệu cần thiết

      // response

      print(response.data); // Log ra để xem dữ liệu mình nhận được

      // Đăng nhập thành công
      if (response.data["status"] == "success") {
        // lưu lại token nhận được trong dữ liệu trả về. Token này được sử dụng để add vào header trong các API khác. Mục đích để bảo mật
        token = response.data["token"];
        // parse dữ liệu nhận được vào class User anh đã khai báo và trả về
        User user = User.fromMap(response.data["data"]);
        return user;
      } else {
        // Đăng nhập thất bại
        return null;
      }
    } catch (error) {
      // bắt các lỗi khác khiến block code trong try {} không hoạt động
      print(error);
      return null;
    }
  }

  //Thêm mới user(quyền admin)
  static Future<CreateNewAccount> createUser(String username, String email,
      String password, String role, dynamic info) async {
    var headers = <String, String>{
      "token": token,
    };
    Map<String, dynamic> body = <String, dynamic>{
      "username": username,
      "email": email,
      "password": password,
      "role": role,
      "info": info,
    };
    //tên của api
    String apiPath = 'api/createUser';
    //tạo POST request
    try {
      var response = await Dio()
          .post(url + apiPath,
              options: new Options(headers: headers), data: body)
          .timeout(Duration(seconds: 10));
      //response
      print(response.data); // Log ra để xem dữ liệu mình nhận được

      //Tạo thành công
      if (response.data["status"] == "success") {
        // parse dữ liệu nhận được vào class CreateNewAccount đã khai báo và trả về
        CreateNewAccount createNewAccount =
            CreateNewAccount().fromMap(response.data["data"]);
        return createNewAccount;
      } else {
        // Tạo thất bại
        return null;
      }
    } catch (error) {
      // bắt các lỗi khác khiến block code trong try {} không hoạt động
      print(error);
      return null;
    }
  }

  //User lấy thông tin cá nhân của mình
  static Future<MyAccountPage> getInfo() async {
    var headers = <String, String>{
      "token": token,
    };
    Map<String, dynamic> body = <String, dynamic>{
      //body để rỗng
    };
    //tên của api
    String apiPath = 'api/getInfo';
    //tạo GET request
    try {
      var response =
          await Dio().get(url + apiPath).timeout(Duration(seconds: 10));

      //response
      print(response.data); // Log ra để xem dữ liệu mình nhận được

      //Lấy được thông tin
      if (response.data["status"] == "success") {
        // parse dữ liệu nhận được vào class MyAccountPage
        MyAccountPage myAccountPage =
            MyAccountPage().fromMap(response.data["data"]);
        return myAccountPage;
      } else {
        // Tạo thất bại
        return null;
      }
    } catch (error) {
      // bắt các lỗi khác khiến block code trong try {} không hoạt động
      print(error);
      return null;
    }
  }
  //Thay đổi password

  static Future<SystemStatus> getSystemStatus() async {
    var headers = <String, String>{
      "token": "ECOPACK-super-token",
      "user-id": "60b6ea97a286332c3d73714a",
    };
    Map<String, dynamic> body = <String, dynamic>{
      //body để rỗng
    };
    //tên của api
    String apiPath = 'api/getEnvirInfo?nodeId=60d04b642704d71956e81872';
    //tạo GET request
    try {
      var response = await Dio()
          .get(url + apiPath, options: new Options(headers: headers))
          .timeout(Duration(seconds: 10));

      //response
      print(response.data); // Log ra để xem dữ liệu mình nhận được

      //Lấy được thông tin
      if (response.data["status"] == "success") {
        // parse dữ liệu nhận được vào class MyAccountPage
        SystemStatus status = new SystemStatus();
        status.gateway = true;
        status.temp =
            double.parse(response.data["data"]["main"]["temp"].toString()) -
                273.0;

        status.pressure =
            double.parse(response.data["data"]["main"]["pressure"].toString());
        status.humidity =
            double.parse(response.data["data"]["main"]["humidity"].toString());
        status.wind =
            double.parse(response.data["data"]["wind"]["speed"].toString());

        return status;
      } else {
        // Tạo thất bại
        return null;
      }
    } catch (error) {
      // bắt các lỗi khác khiến block code trong try {} không hoạt động
      print(error);
      return null;
    }
  }
  //Thay đổi password

  static Future<bool> changepassword(
      String oldPassword, String newPassword) async {
    var headers = <String, String>{
      "token": token,
      "user-id": AppData.user.id,
    };
    Map<String, dynamic> body = <String, dynamic>{
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    };
    //tên của api
    String apiPath = 'api/changePassword';
    //tạo POST request
    try {
      var response = await Dio()
          .post(url + apiPath,
              options: new Options(headers: headers), data: body)
          .timeout(Duration(seconds: 10));
      //response
      print(response.data); // Log ra để xem dữ liệu mình nhận được

      //Đổi thành công
      if (response.data["status"] == "success") {
        // parse dữ liệu nhận được vào class ChangePasswordPage đã khai báo và trả về

        return true;
      } else {
        // Đổi thất bại
        return false;
      }
    } catch (error) {
      // bắt các lỗi khác khiến block code trong try {} không hoạt động
      print(error);
      return false;
    }
  }

  // Đổi tên tài khoản
  static Future<ChangeNamePage> changename(String newName) async {
    var headers = <String, String>{
      "token": token,
    };
    Map<String, dynamic> body = <String, dynamic>{
      "newName": newName,
    };
    //tên của api
    String apiPath = 'api/changeName';
    //tạo POST request
    try {
      var response = await Dio()
          .post(url + apiPath,
              options: new Options(headers: headers), data: body)
          .timeout(Duration(seconds: 10));
      //response
      print(response.data); // Log ra để xem dữ liệu mình nhận được

      //Đổi thành công
      if (response.data["status"] == "success") {
        // parse dữ liệu nhận được vào class ChangeNamePage đã khai báo và trả về
        ChangeNamePage changeNamePage =
            ChangeNamePage.fromMap(response.data["data"]);
        return changeNamePage;
      } else {
        // Đổi thất bại
        return null;
      }
    } catch (error) {
      // bắt các lỗi khác khiến block code trong try {} không hoạt động
      print(error);
      return null;
    }
  }

  //Điều khiển bơm trong một node
  static Future<bool> setTiming(
      String idnode, int pumpIndex, List<Timing> timing) async {
    var headers = <String, String>{
      "token": token,
      "user-id": AppData.user.id,
    };
    Map<String, dynamic> body = <String, dynamic>{
      "nodeId": idnode,
      "pumpIndex": pumpIndex,
      "timing": timing.map((e) => e.toMap()).toList()
    };
    print(body);
    //tên của api
    String apiPath = 'api/setTiming';
    //tạo POST request
    try {
      var response = await Dio()
          .post(url + apiPath,
              options: new Options(headers: headers), data: body)
          .timeout(Duration(seconds: 10));
      //response
      print(response.data); // Log ra để xem dữ liệu mình nhận được

      //Sửa thành công
      if (response.data["status"] == "success") {
        return true;
      } else {
        // Sửa thất bại
        return false;
      }
    } catch (error) {
      // bắt các lỗi khác khiến block code trong try {} không hoạt động
      print(error);
      return false;
    }
  }

  // Lấy danh sách node
  static Future<List<Node>> getListNode() async {
    var headers = <String, String>{
      "token": token,
      "user-id": AppData.user.id,
    };
    Map<String, dynamic> body = <String, dynamic>{
      //
    };
    //tên của api
    String apiPath = 'api/getListNode';
    //tạo POST request
    try {
      var response = await Dio()
          .get(url + apiPath, options: new Options(headers: headers))
          .timeout(Duration(seconds: 10));
      //response
      //print(response.data); // Log ra để xem dữ liệu mình nhận được

      //Đổi thành công
      if (response.data["status"] == "success") {
        // parse dữ liệu nhận được vào class ChangePasswordPage đã khai báo và trả về
        List<Node> nodes = [];
        response.data["data"].forEach((n) {
          //print(n);
          Node node = Node.fromMap(n);
          List<List<Timing>> timings = [];
          n["timing"].forEach((time) {
            List<Timing> timing = [];
            //print(time);
            if (time != null)
              time.forEach((t) {
                //print(t);
                Timing tm = Timing.fromMap(t);
                timing.add(tm);
              });
            timings.add(timing);
          });
          node.timing = timings;
          nodes.add(node);
        });
        return nodes;
      } else {
        // Đổi thất bại
        return null;
      }
    } catch (error) {
      // bắt các lỗi khác khiến block code trong try {} không hoạt động
      print(error);
      return null;
    }
  }

  static Future<bool> controlNode(Node node) async {
    var headers = <String, String>{
      "token": token,
      "user-id": AppData.user.id,
    };
    Map<String, dynamic> body = <String, dynamic>{
      "nodeId": node.id,
      "pump": node.listPump,
    };
    //tên của api
    String apiPath = 'api/control/nodeControl';
    //tạo POST request
    try {
      var response = await Dio()
          .post(url + apiPath,
              options: new Options(headers: headers), data: body)
          .timeout(Duration(seconds: 10));
      //response
      print(response.data); // Log ra để xem dữ liệu mình nhận được

      //Thêm thành công
      if (response.data["status"] == "success") {
        return true;
      } else {
        // Thêm thất bại
        return false;
      }
    } catch (error) {
      // bắt các lỗi khác khiến block code trong try {} không hoạt động
      print(error);
      return false;
    }
  }

  static Future<Node> addNode(String name, String des, LatLng location) async {
    var headers = <String, String>{
      "token": token,
      "user-id": AppData.user.id,
    };
    Map<String, dynamic> body = <String, dynamic>{
      "name": name,
      "description": des,
      "location": location.toMap(),
    };
    //tên của api
    String apiPath = 'api/createNode';
    //tạo POST request
    try {
      var response = await Dio()
          .post(url + apiPath,
              options: new Options(headers: headers), data: body)
          .timeout(Duration(seconds: 10));
      //response
      print(response.data); // Log ra để xem dữ liệu mình nhận được

      //Thêm thành công
      if (response.data["status"] == "success") {
        Node node = Node.fromMap(response.data["data"]);
        List<List<Timing>> timings = [
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
        ];
        node.timing = timings;
        return node;
      } else {
        // Thêm thất bại
        return null;
      }
    } catch (error) {
      // bắt các lỗi khác khiến block code trong try {} không hoạt động
      print(error);
      return null;
    }
  }
}
