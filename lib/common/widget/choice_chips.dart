import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_function.dart';
import 'custom_shape/containers/circular_containner.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    // Determine if text represents a color or a non-color value
    final colorValue = THelperFunction.getColor(text);

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        // Only display text if it's not a recognized color
        label:  Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        // If text is a recognized color, display it with a colored circle avatar
        avatar: colorValue != null
            ? CircularContainer(width: 20, height: 20, backgroundColor: colorValue)
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: selected ? TColors.primaryColor : TColors.grey,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        backgroundColor: selected ? TColors.primaryColor : TColors.grey,
      ),
    );
  }
}
