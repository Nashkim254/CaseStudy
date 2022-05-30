import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecnical_test/Api/apis.dart';

///------------------------------------
/// Print to console in red
///------------------------------------
 printError(text, {name = '📕: error'}) =>
    _log('\x1B[31m --- $text --- \x1B[0m', name);

///------------------------------------
/// Print to console in green
///------------------------------------
 printSuccess(text, {name = '📙: success'}) =>
    _log('\x1B[32m --- $text --- \x1B[0m', name);

///------------------------------------
/// Print to console in yellow
///------------------------------------
 printWarning(text, {name = '📗: warning'}) =>
    _log('\x1B[33m --- $text --- \x1B[0m', name);

///------------------------------------
/// Print to console in blue
///------------------------------------
 printInfo(text, {name = '📘: info'}) =>
    _log('\x1B[34m --- $text --- \x1B[0m', name);

///------------------------------------
/// Print to console in white
///------------------------------------
 printNormal(text, {name = '📓: normal'}) =>
    _log('\x1B[37m --- $text --- \x1B[0m', name);

 _log(body, name) {
  return Apis.appProduction ? "?" : debugPrint('\x1B[31m$body\x1B[0m');
}

///------------------------------------
/// Print to dialog in red
///------------------------------------
 showToastError(body, {name = 'Error'}) =>
    _showToast(body, name, Colors.red.withOpacity(0.1));

///------------------------------------
/// Print to dialog in green
///------------------------------------
 showToastSuccess(body, {name = 'Success'}) =>
    _showToast(body, name, Colors.green.withOpacity(0.1));

///------------------------------------
/// Print to dialog in yellow
///------------------------------------
 showToastWarning(body, {name = 'Warning'}) =>
    _showToast(body, name, Colors.yellow.withOpacity(0.1));

///------------------------------------
/// Print to dialog in blue
///------------------------------------
 showToastInfo(body, {name = 'Info'}) =>
    _showToast(body, name, Colors.blue.withOpacity(0.1));

///------------------------------------
/// Print to dialog in white
///------------------------------------
 showToast(body, {name = ''}) =>
    _showToast(body, name, Colors.grey.withOpacity(0.2));

dynamic _showToast(body, name, color) {
  Get.snackbar(name, body,
      snackPosition: SnackPosition.TOP, backgroundColor: color);
}