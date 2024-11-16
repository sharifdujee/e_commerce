import 'package:e_commerce_admin_panel/common/widget/layout/templates/site_layout.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/reset_password/reponsive_design/reset_password_desktop.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/reset_password/reponsive_design/reset_password_mobile.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static const resetPassword = '/resetPassword';

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(userLayout: false,desktop: ResetPasswordDesktopTablet(),mobile: ResetPasswordMobile(),);

  }
}
