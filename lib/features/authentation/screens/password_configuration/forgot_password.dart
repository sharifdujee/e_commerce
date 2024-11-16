import 'package:e_commerce_app/features/authentation/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/features/authentation/screens/password_configuration/reset_password.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Heading
          Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(
            height: TSizes.spaceBtwItem,
          ),
          Text(TTexts.yourAccountCreatedSubtitle, style: Theme.of(context).textTheme.labelMedium,),
          const SizedBox(
            height: TSizes.spaceBtwSections *2,
          ),
          /// Text Field
          Form(
            key: controller.forgetPasswordFormKey,
            child: TextFormField(
              controller: controller.email,
              validator: TValidator.validateEmail,
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)
              ),

            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          /// button
          /// button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Validate the form
                if (controller.forgetPasswordFormKey.currentState!.validate()) {
                  // If the form is valid, navigate to the ResetPassword screen
                  Get.off(() => ResetPassword(email: controller.email.text.trim()));
                } else {
                  // If the form is not valid, the validator will automatically show error messages
                }
              },
              child: const Text(TTexts.submit),
            ),
          ),


        ],
      ),),
    );
  }
}
