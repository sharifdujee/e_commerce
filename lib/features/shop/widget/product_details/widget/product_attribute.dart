import 'package:e_commerce_app/features/shop/controller/variation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widget/choice_chips.dart';
import '../../../../../common/widget/custom_shape/containers/rounded_container.dart';
import '../../../../../common/widget/texts/product_price_text.dart';
import '../../../../../common/widget/texts/product_title_text.dart';
import '../../../../../common/widget/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../../personalization/model/product/product_model.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    final controller =  Get.put((VariationController()));

    // Debugging: Check product attributes on build
   // print('Product attributes on build: ${product.productAttributes}');
   // print('Number of attributes: ${product.productAttributes?.length}');

    return Obx(()=>Column(
        children: [
          if(controller.selectedVariation.value.id.isNotEmpty)
          TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: darkMode ? TColors.darkGrey : TColors.grey,
            child: Column(
              children: [
                Row(
                  children: [
                    const TSectionHeading(title: 'Variation', showActionButton: false),
                    const SizedBox(width: TSizes.spaceBtwItem),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const TProductTitleText(title: 'Price ', smallSizes: true),
                            const SizedBox(width: TSizes.spaceBtwItem),
                            Text(
                              '\$${controller.selectedVariation.value.price}',
                              style: Theme.of(context).textTheme.titleSmall!.apply(
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(width: TSizes.defaultSpace),
                            TProductPriceText(price: controller.getVariationPrice())
                          ],
                        ),
                        Row(
                          children: [
                            const TProductTitleText(title: 'Stock ', smallSizes: true),
                            const SizedBox(width: TSizes.spaceBtwItem),
                            Text(
                              controller.variationStatus.value,
                              style: Theme.of(context).textTheme.titleMedium!.apply(
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(width: TSizes.defaultSpace),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                 TProductTitleText(
                  title: controller.selectedVariation.value.description??'',
                  smallSizes: true,
                  maxLines: 4,
                )
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItem),

          // Attributes Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (product.productAttributes ?? []).isNotEmpty
                ? product.productAttributes!.map((attribute) {
              // Debugging: Ensure attribute name and values are printed
              //print('Rendering attribute: ${attribute.name} with values: ${attribute.values}');

              // Ensure values are present and not empty
              final values = attribute.values ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TSectionHeading(title: attribute.name ?? 'Attribute'),
                  const SizedBox(height: TSizes.spaceBtwItem / 2),
                  Obx(()=>Wrap(
                      spacing: 8,
                      children: attribute.values!.map((attributeValue) {
                        final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                        final available = controller.getAvailableAttributeVariation(product.productsVariations!, attribute.name!).contains(attributeValue);


                        return TChoiceChip(
                          text: attributeValue,
                          selected: isSelected, // Replace with your selection logic
                          onSelected: available
                              ? (selected) {
                            if(selected && available){
                              controller.onAttributeSelected(product, attribute.name??'', attributeValue);
                            }
                            // Your logic when selected
                            print('Item selected: $selected');
                          }
                              : null,

                          // Implement selection logic here


                        );
                      }).toList()
                    ),
                  ),
                ],
              );
            }).toList()
                : [
              const Center(child: Text('No attributes available for this product')),
            ],
          ),
        ],
      ),
    );
  }
}
