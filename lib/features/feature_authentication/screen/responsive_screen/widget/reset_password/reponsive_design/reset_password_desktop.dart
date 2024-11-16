import 'package:e_commerce_admin_panel/common/widget/layout/templates/login_template.dart';
import 'package:e_commerce_admin_panel/utils/constants/images_strings.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:e_commerce_admin_panel/utils/constants/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../routes/routes.dart';
import '../widget/reset_password_widget.dart';
class ResetPasswordDesktopTablet extends StatelessWidget {
  const ResetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final email =  Get.parameters['email']??'';
    return TLoginTemplate(child: ResetPasswordWidget(email: email));
  }
}


