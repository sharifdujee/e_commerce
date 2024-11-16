import 'package:e_commerce_app/common/widget/custom_shape/containers/rounded_container.dart';
import 'package:e_commerce_app/features/personalization/controller/cart_controller/orderController.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/helpers/animationLoader.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot){
        final emptyWidget = TAnimationLoaderWidget(text: 'Whoops', animation: TImages.successAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: ()=>Get.off(()=>const NavigationMenu()),
        );

        final response = TCloudHelperFunction.checkMultiRecord(snapShot: snapshot, nothingFound: emptyWidget);
        if(response !=null) return response;
        final orders = snapshot.data!;
        return  ListView.separated(
          separatorBuilder: (_, snapshot) => const SizedBox(
            height: TSizes.spaceBtwItem,
          ),
          itemCount: orders.length,
          shrinkWrap: true,

          itemBuilder:(_, index) {
            final order = orders[index];
            return TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      /// Icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: TSizes.spaceBtwItem / 2),

                      /// Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context).textTheme.bodyLarge!.apply(
                                  color: TColors.primaryColor, fontSizeDelta: 1),
                            ),
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),

                      /// Button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_34,
                          size: TSizes.iconSm,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItem),

                  /// Details Row (Order and Shipping)
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            /// Icon
                            const Icon(Iconsax.tag),
                            const SizedBox(width: TSizes.spaceBtwItem / 2),

                            /// Order Details
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(color: TColors.primaryColor, fontSizeDelta: 1),
                                ),
                                Text(
                                  order.id,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItem),

                      Expanded(
                        child: Row(
                          children: [
                            /// Icon
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: TSizes.spaceBtwItem / 2),

                            /// Shipping Details
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(color: TColors.primaryColor, fontSizeDelta: 1),
                                ),
                                Text(
                                  order.formatedDeliveryDate,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

        );
      },

    );
  }
}
