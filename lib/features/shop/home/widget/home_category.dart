import 'package:e_commerce_app/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/features/shop/widget/sub_category/sub_categories.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/TCategoryShimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widget/image_text_widget/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx((){
      if(categoryController.isLoading.value) return const TCategoryShimmer();
      if(categoryController.featureCategories.isEmpty){
        return Center(
          child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
        );

      }
      else{
        return  SizedBox(
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryController.featureCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                final category = categoryController.featureCategories[index];
                // In THomeCategories widget (where you build the ListView)
                return TVerticalImageText(
                  image: category.image,
                  title: category.name,
                  onTap: () => Get.to(() =>  SubCategoriesScreen(category: category)),
                  isNetworkImage: Uri.tryParse(category.image)?.hasAbsolutePath ?? false, // Set to true for URLs
                );




              }),
        );
      }

    }

    );
  }
}