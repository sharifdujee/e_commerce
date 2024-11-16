import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/forget_passord/widget/header_form.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MobileForgetPassword extends StatelessWidget {
  const MobileForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ForgetPasswordHeaderAndForm(),
      )),
    );
  }
}
