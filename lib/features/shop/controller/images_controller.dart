
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController{
  static ImagesController get instance => Get.find();
  
  RxString selectedProductImage = ''.obs;


  @override
  void onInit() {
    super.onInit();
  }

  List<String> getAllProductsImage(ProductModel product){
    Set<String> images = {};
    /// load Thumbnail Image
    images.add(product.thumbnail);
    /// assign thumbnail image as selected image
    selectedProductImage.value = product.thumbnail;
     /// product Image
    if(product.images !=null){
      images.addAll(product.images!);
    }
    /// all image from product variation
    if(product.productsVariations!=null || product.productsVariations!.isNotEmpty){
      images.addAll(product.productsVariations!.map((variation)=> variation.image));
    }
    return images.toList();
    
    
  }
  void showEnlargedImage(String image){
    Get.to(fullscreenDialog: true,
        ()=> Dialog.fullscreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: TSizes.defaultSpace *2, horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(onPressed: ()=>Get.back(), child: const Text('Close')),
                ),
              )
            ],
          ),
        ) );
    
  }
}