import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_admin_panel/common/enum.dart';
import 'package:e_commerce_admin_panel/common/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.height,
    this.width,
     this.image,
    this.border,
    this.backgroundColor,
    this.padding = TSizes.sm,
    this.isNetworkImage = true, // Set to true to handle network images
    this.onPressed,
    this.fit = BoxFit.contain,
    this.applyImageRadius = true,
    this.borderRadius = TSizes.md,
    required this.imageType,
    this.margin, this.overlayColor, this.memoryImage,
    this.file
  });

  final double? height;
  final double? width;
  final String? image;
  final BoxBorder? border;
  final Color? backgroundColor;
  final double? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final BoxFit? fit;
  final bool applyImageRadius;
  final double borderRadius;
  final ImageType imageType;
  final double? margin;
  final Color? overlayColor;
  final Uint8List? memoryImage;
  final File? file;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      margin: margin!=null? EdgeInsets.all(margin!):null,
      decoration: BoxDecoration(
        border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: _buildImageWidget(),
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
        color: overlayColor,
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
      return  Image(image: FileImage(file!), fit: fit,color: overlayColor,);
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
      return Image(image: MemoryImage(memoryImage!), fit: fit,color: overlayColor,);
    }
    else{
      return Container();
    }
  }

}
