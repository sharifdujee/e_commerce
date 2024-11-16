import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../../../../routes/routes.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/texts.dart';

class ForgetPasswordHeaderAndForm extends StatelessWidget {
  const ForgetPasswordHeaderAndForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      /// create Header
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
        const SizedBox(
          height: TSizes.spaceBtwItem,
        ),
        Text(
          TTexts.forgetPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItem,
        ),
        Text(
          TTexts.forgetPasswordSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections * 2,
        ),
        Card(
          child: Form(
              child: TextFormField(
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
          )),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => Get.toNamed(TRoutes.resetPassword,
                  parameters: {'email': 'rahad99@gmail.com'}),
              child: const Text(TTexts.submit)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections * 2,
        )
      ],
    );
  }
}
