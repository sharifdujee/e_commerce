import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../routes/routes.dart';
import '../../../../../../../utils/constants/images_strings.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/texts.dart';
class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
     this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///back Button
        Row(
          children: [
            IconButton(onPressed: ()=>Get.offAllNamed(TRoutes.loginScreen), icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItem,
        ),
        /// image
        const Image(image: AssetImage(TImages.deliveredEmailIllustration)),
        const SizedBox(
          height: TSizes.spaceBtwItem,
        ),
        Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
        const SizedBox(
          height: TSizes.spaceBtwItem,
        ),
        Text(email!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge,),
        const SizedBox(
          height: TSizes.spaceBtwItem,
        ),
        Text(TTexts.changeYourPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        const SizedBox(
          height: TSizes.spaceBtwItem,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: ()=>Get.offAllNamed(TRoutes.loginScreen), child: const Text(TTexts.done)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItem,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: (){}, child: const Text(TTexts.resendEmail)),
        )

      ],
    );
  }
}