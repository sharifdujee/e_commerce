import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/images_strings.dart';
import '../../../utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.border,
    this.backgroundColor,
    this.padding,
    this.isNetworkImage = true, // Set to true to handle network images
    this.onPressed,
    this.fit = BoxFit.contain,
    this.applyImageRadius = true,
    this.borderRadius = TSizes.md,
  });

  final double? height;
  final double? width;
  final String imageUrl;
  final BoxBorder? border;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final BoxFit? fit;
  final bool applyImageRadius;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) {
              // Log error for debugging
              print('Error loading network image: $error');
              print('Failed URL: $url');
              return Image.asset(
                TImages.productImage5, // Replace with your placeholder asset path
                fit: fit,
              );
            },
          )
              : Image.asset(
            imageUrl,
            fit: fit,
            errorBuilder: (context, error, stackTrace) {
              // Log error for debugging
              print('Error loading asset image: $error');
              return Image.asset(
                TImages.productImage6, // Replace with fallback asset
                fit: fit,
              );
            },
          ),
        ),
      ),
    );
  }
}
