import 'package:e_commerce_app/common/style/text_spacing.dart';
import 'package:e_commerce_app/common/widget/login_signup/form_divider.dart';
import 'package:e_commerce_app/features/authentation/screens/login/widget/login_form.dart';
import 'package:e_commerce_app/features/authentation/screens/login/widget/login_header.dart';
import 'package:e_commerce_app/common/widget/login_signup/social_button.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            /// logo
            LoginHeader(),
            TLoginForm(),

            ///Divider

            TFormDivider(
              dividerTitle: TTexts.orSignInWith,
            ),

            ///footer
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TSocialButton(),
          ],
        ),
      ),
    );
  }
}
