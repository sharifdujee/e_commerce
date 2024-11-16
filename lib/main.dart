import 'package:e_commerce_admin_panel/features/feature_authentication/repositories/authentication_repository.dart';
import 'package:e_commerce_admin_panel/firebase_options.dart';
import 'package:e_commerce_admin_panel/screen/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  /// initialize local storage
   await GetStorage.init();
  /// remove hash sign from url
   setPathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then((value)=>Get.put(AuthenticationRepository()));
  runApp(App());
}



