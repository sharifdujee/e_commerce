import 'package:e_commerce_admin_panel/common/widget/layout/header/header.dart';
import 'package:e_commerce_admin_panel/common/widget/layout/sidebar/side_bar.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const  DesktopLayout({super.key, this.body});
  final Widget? body;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Drawer with fixed width and height
          const Expanded(
            child: TSideBar(),
          ),


          // Main content container with a fixed height
          Expanded(
            flex: 5,
            child: Column(
              children: [
                ///header
                 const TAppHeader(),

                /// body
                Expanded(
                    child:
                        body ?? const SizedBox())
              ],
            ),
          ),
        ],
      ),
    );
  }
}


