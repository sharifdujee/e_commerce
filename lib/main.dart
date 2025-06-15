import 'package:flutter/material.dart';
import 'package:business_app/my_app.dart';

import 'core/common/widget/global_wraper.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GlobalAppWrapper(child: MyApp()));
}
