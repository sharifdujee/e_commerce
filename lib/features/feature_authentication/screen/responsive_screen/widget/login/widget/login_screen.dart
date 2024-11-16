import 'package:e_commerce_admin_panel/common/widget/layout/templates/site_layout.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/login/responsive_design/login_mobile.dart';
import 'package:flutter/material.dart';

import '../responsive_design/login_desktop_tablet.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const login = '/login';

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(userLayout: false,desktop: LoginDesktopTablet(),mobile: LoginMobile(),);

  }
}
