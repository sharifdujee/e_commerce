import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/features/shop/controller/banner_controller.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/simmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/custom_shape/containers/circular_containner.dart';
import '../../../../common/widget/images/t_rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:get/get.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx((){
      if(controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);

      if(controller.banners.isEmpty) {
        return const Center(
          child: Text('No Data Found'),
        );
      }
     else{
        return Column(
          children: [
            CarouselSlider(items: controller.banners.map((banner)=> TRoundedImage(imageUrl: banner.imageUrl, isNetworkImage: true, onPressed: ()=>Get.toNamed((banner.targetScreen)),)).toList(),
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) => controller.updatePageIndicator(index)
                )),
            const SizedBox(
              height: TSizes.defaultSpace,
            ),
            Center(
              child: Obx(
                    () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for(int i = 0; i<controller.banners.length; i++)
                      CircularContainer(
                        width: 4,
                        height: 20,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor: controller.carousalCurrentIndex.value == i ? TColors.primaryColor: TColors.grey,
                      ),


                  ],
                ),
              ),
            ),
          ],
        );
      }
    }
    );
  }
}