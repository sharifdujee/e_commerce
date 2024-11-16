
import 'dart:io';

import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtils{

  static void hideKeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async{
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color),);

  }

  static bool isLandScopeOrientation (BuildContext context){
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom ==0;
  }
  static String truncateText(String text, int maxLength){
    if(text.length <=maxLength){
      return text;
    }
    else{
      return text.substring(0, maxLength);
    }
  }


  static bool isPortraitOrientation(BuildContext context){
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable){
    SystemChrome.setEnabledSystemUIMode(enable?SystemUiMode.immersiveSticky: SystemUiMode.edgeToEdge);
  }

  static double getScreenHeight (){
    return MediaQuery.of(Get.context!).size.height;
  }
  static double getScreenWidth (){
    return MediaQuery.of(Get.context!).size.width;
  }
  static double getPixelRatio (){
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }
  static double getStatusBarHeight (){
    return MediaQuery.of(Get.context!).padding.top;
  }

  static void launchUrl(String url) async{
    if(await canLaunchUrlString(url)){
      await launchUrlString(url);
    }
    else{
      throw 'Could not launch $url';
    }
  }

  static bool isAndroid(){
    return Platform.isAndroid;
  }
  static bool isIOS (){
    return Platform.isIOS;

  }
  static bool isDesktopScreen(BuildContext context){
    return MediaQuery.of(context).size.width >= TSizes.desktopSize;
  }
  static bool isTabletScreen(BuildContext context){
    return MediaQuery.of(context).size.width >= TSizes.tabletSize &&  MediaQuery.of(context).size.width < TSizes.desktopSize;
  }

  static bool isMobileScreen(BuildContext context){
    return MediaQuery.of(context).size.width < TSizes.tabletSize;
  }

  static double getAppbarHeight(){
    return kToolbarHeight;
  }
  static double getKeyboardHeight(){
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible() async{
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;

  }

  static Future<bool> isPhysicalDevice() async{
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }

  static double getBottomNavigationBarHeight() {
    return MediaQuery.of(Get.context!).padding.bottom;
  }



}