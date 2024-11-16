import 'package:e_commerce_admin_panel/common/widget/layout/templates/login_template.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/login/login_form.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/login/login_header.dart';
import 'package:flutter/material.dart';


class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplate(
        child: Column(
      children: [
        TLoginHeader(),
        TLoginForm()],
    ));
  }
}
