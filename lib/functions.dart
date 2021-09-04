import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Functions {
  // Loading Controller
  // Type loading, success, error
  static showLoading(String type, String content) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.black54
      ..progressColor = Colors.cyanAccent
      ..indicatorColor = type == "loading"
          ? Colors.cyanAccent
          : type == "success"
              ? Colors.lightGreenAccent[400]
              : Colors.redAccent
      ..textColor = Colors.cyanAccent
      ..userInteractions = type == "loading" ? false : true;

    switch (type) {
      case 'success':
        {
          EasyLoading.showSuccess(content);
          break;
        }
      case 'error':
        {
          EasyLoading.showError(content);
          break;
        }
      case 'dismiss':
        {
          EasyLoading.dismiss();
          break;
        }
      default:
        {
          EasyLoading.show(status: content);
          break;
        }
    }
  }

  static String getTimeString(int value) {
    int hour = value ~/ 60;
    int minute = value % 60;

    return hour.toString() +
        "h" +
        (minute == 0 ? "00" : minute.toString()) +
        "p";
  }
}
