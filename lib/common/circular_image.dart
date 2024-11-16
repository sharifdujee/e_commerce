import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_admin_panel/common/enum.dart';
import 'package:e_commerce_admin_panel/common/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../utils/helper/helper.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.height = 56,
    this.width = 56,
    this.padding = TSizes.sm,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.overlyColor,
    this.backgroundColor,
    required this.image,
    this.onTap, this.file,  this.imageType =ImageType.assets, this.memoryImage,
    this.applyImageRadius = true,
    this.borderRadius = TSizes.md,
  });
  final double height, width, padding;
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? overlyColor;
  final Color? backgroundColor;
  final String image;
  final File? file;
  final ImageType imageType;
  final Uint8List? memoryImage;
  final bool applyImageRadius;
  final double borderRadius;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunction.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: _buildImageWidget()
    );
  }

  Widget _buildImageWidget() {
    Widget imageWidget;
    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.assets:
        imageWidget = _buildAssetImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
        break;
    }

    return ClipRRect(
      borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
      child: imageWidget, // Pass imageWidget as the child to ClipRRect
    );
  }

  Widget _buildNetworkImage() {
    if(image != null){
      return CachedNetworkImage(imageUrl: image!,
        fit:  fit,
        //color: overlayColor,
        errorWidget: (context, url, error)=>const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, downloadProgress)=> const TShimmerEffect(width: 80, height: 80),


      );
    }
    else{
      return Container();
    }
  }

  Widget _buildFileImage() {
    if(file != null){
      return  Image(image: FileImage(file!), fit: fit);
    }
    else{
      return Container();
    }

  }

  Widget _buildAssetImage() {
    if(image != null){
      return Image(image: AssetImage(image!), fit: fit,);
    }
    else{
      return Container();
    }
  }

  Widget _buildMemoryImage() {
    if(memoryImage!= null){
      return Image(image: MemoryImage(memoryImage!), fit: fit,);
    }
    else{
      return Container();
    }
  }

}
