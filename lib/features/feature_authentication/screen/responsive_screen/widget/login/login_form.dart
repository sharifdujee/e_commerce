import 'package:e_commerce_admin_panel/features/feature_authentication/controller/login_controller.dart';
import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:e_commerce_admin_panel/utils/helper/validatro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Card(
      child: Form(
          key: loginController.loginFormKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
            child: Column(
              children: [
                TextFormField(
                  validator: TValidator.validateEmail,
                  controller: loginController.email,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Obx(
                  () => TextFormField(
                    controller: loginController.password,
                    obscureText: loginController.hidePassword.value,
                    validator: (value) =>
                        TValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () => loginController.hidePassword
                                .value = !loginController.hidePassword.value,
                            icon: Icon(loginController.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye))),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields / 2,
                ),

                /// remember  me
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() => Checkbox(
                            value: loginController.rememberMe.value,
                            onChanged: (value) =>
                                loginController.rememberMe.value = value!)),
                        const Text(TTexts.rememberMe),
                      ],
                    ),

                    /// forgot password
                    TextButton(
                        onPressed: () => Get.toNamed(TRoutes.forgetPassword),
                        child: const Text(TTexts.forgotPassword))
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ///sign in button
                /*SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => loginController.registerAdmin(),
                      child: const Text(TTexts.signIn))),*/
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          print('Test');
                          loginController.emailAndPasswordSignIn();
                        } ,
                        child: const Text(TTexts.signIn)))



              ],
            ),
          )),
    );
  }
}
