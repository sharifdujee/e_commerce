import 'package:flutter/material.dart';

import '../../../../constants.dart';

class OnBoardingContent extends StatelessWidget {
  final bool isTextOnTop;
  final String title;
  final String description;
  final String image;
  const OnBoardingContent(
      {super.key,
      this.isTextOnTop = false,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        if (isTextOnTop)
          OnBoardingTitleDescription(title: title, description: description),
        if (isTextOnTop) const Spacer(),
        Image.asset(image, height: 250),
        if (!isTextOnTop) const Spacer(),
        if (!isTextOnTop)
          const OnBoardingTitleDescription(
            title: 'Find the item you’ve \nbeen looking for',
            description:
                'Here you’ll see rich varieties of goods, carefully classified for seamless browsing experience',
          ),
      ],
    );
  }
}

class OnBoardingTitleDescription extends StatelessWidget {
  final String title;
  final String description;
  const OnBoardingTitleDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
