import 'package:e_commerce_admin_panel/common/widget/layout/templates/login_template.dart';
import 'package:flutter/material.dart';

import '../widget/header_form.dart';
class DesktopTableForgetPassword extends StatelessWidget {
  const DesktopTableForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplate(child: ForgetPasswordHeaderAndForm());
  }
}


