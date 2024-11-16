import 'package:e_commerce_admin_panel/common/widget/layout/templates/site_layout.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/forget_passord/responsive_design/desktop_table_forgetpassword.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/forget_passord/responsive_design/mobile_forgetPassword.dart';
import 'package:flutter/material.dart';
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static const forgetPassword = '/forgetPassword';

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(userLayout: false, desktop: DesktopTableForgetPassword(), mobile: MobileForgetPassword(),);

  }
}
