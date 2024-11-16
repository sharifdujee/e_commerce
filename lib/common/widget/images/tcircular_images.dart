import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../../utils/helpers/shimmer/simmer_effect.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,  this.height = 56,  this.width = 56,  this.padding = TSizes.sm, this.fit = BoxFit.cover,  this.isNetworkImage = false, this.overlyColor, this.backgroundColor, required this.image, required this.title, this.onTap,
  });
  final double height, width, padding;
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? overlyColor;
  final Color? backgroundColor;
  final String image;
  final String title;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:  backgroundColor??(THelperFunction.isDarkMode(context)?TColors.black: TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child:Center(
            child: isNetworkImage?
            CachedNetworkImage(
              fit: fit,
                color: overlyColor,
                imageUrl: image,
              progressIndicatorBuilder: (context, url, downloadProgress)=>const TShimmerEffect(width: 55, height: 55),
              errorWidget: (context, url, error)=>const Icon(Icons.error),
            ):Image(
              fit: fit,
                color: overlyColor,
                image: AssetImage(image)),
          ),
        ),
      );
  }
}