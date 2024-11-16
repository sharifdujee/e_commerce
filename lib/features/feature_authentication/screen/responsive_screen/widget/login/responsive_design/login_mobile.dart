import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/login/login_form.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/login/login_header.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [TLoginHeader(), TLoginForm()],
          ),
        ),
      ),
    );
  }
}
