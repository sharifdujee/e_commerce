import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class THelperFunction {
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    }
    else if(value == 'Yellow'){
      return Colors.yellow;
    }
    return Colors.black12;
  }

  // Function to get screen height
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  // Function to get screen width
  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }
  
  static void navigateToScreen(BuildContext context, Widget screen){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> screen));
  }
  static String truncateText(String text, int maxLength){
    if(text.length <=maxLength){
      return text;
    }
    return text.substring(0, maxLength);
  }
  
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
  
  static void showSnackBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message),),);
  }
  
  static void showAlert(String title, String message){
    showDialog(context: Get.context!, 
        builder: (BuildContext context){
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: ()=> Navigator.of(context).pop, child: const Text('Ok'))
        ],
      );
      
        });
  }

  static String getFormattedDate(DateTime date) {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }
}
