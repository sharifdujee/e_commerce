import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/features/shop/controller/all_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../layout/grid_layout.dart';
import '../widget/product_card_vertical.dart';
import 'package:get/get.dart';
class TSortableProduct extends StatelessWidget {
  const TSortableProduct({
    super.key,
    required this.products
  });
  final List<ProductModel> products;



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            value: controller.selectedOptions.value,
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ]
                .map((option) =>
                DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            onChanged: (value) {
              controller.sortProducts(value!);
            }),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// all products
        TGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) =>  Obx(()=>TProductCardVertical(product: controller.products[index])))
      ],
    );
  }
}