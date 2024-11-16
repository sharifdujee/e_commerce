import 'package:e_commerce_admin_panel/common/widget/layout/header/header.dart';
import 'package:e_commerce_admin_panel/common/widget/layout/sidebar/side_bar.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});
  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  static const secondScreen = '/second_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const TSideBar(),
        appBar: TAppHeader(
          scaffoldKey: scaffoldKey,
        ),
        body: body ?? Container());
  }
}
