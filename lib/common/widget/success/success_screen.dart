import 'package:e_commerce_app/common/style/text_spacing.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/helpers/helper_function.dart';
class SuccessScreen extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: TSpacingStyle.paddingWithAppBarHeight *2,
        child: Column(
          children: [
            Image(image: AssetImage(image),
              width: THelperFunction.getScreenWidth() * 0.6,),
            const SizedBox(
                height:   TSizes.spaceBtwSections
            ),
            /// Text
            Text(title, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            const SizedBox(
              height:TSizes.spaceBtwItem ,
            ),

            Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(
                height:   TSizes.spaceBtwSections
            ),
            const SizedBox(
                height:   TSizes.spaceBtwSections
            ),
            /// Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: onPressed, child: const Text(TTexts.tContinue)),
            ),
          ],
        ),) ,
      ),
    );
  }
}
