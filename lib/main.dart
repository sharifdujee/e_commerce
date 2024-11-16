import 'package:e_commerce_app/app.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'data/repositories/authentication_repositories/authentication_repositories.dart';
void main() async {
 final WidgetsBinding widgetsBinding =   WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init();
   FlutterNativeSplash.preserve(widgetsBinding:widgetsBinding);
  /// initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value)=> Get.put(AuthenticationRepository()));
  runApp(const App());
}

//