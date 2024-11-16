import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/texts.dart';

class TFormDivider extends StatelessWidget {
  final String dividerTitle;
  const TFormDivider({
    super.key,
    required this.dividerTitle

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark? TColors.darkGrey: TColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(dividerTitle, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(
          child: Divider(
            color: dark? TColors.darkGrey: TColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}