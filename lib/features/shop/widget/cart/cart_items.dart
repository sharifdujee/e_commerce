import 'package:e_commerce_app/features/personalization/controller/cart_controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/texts/product_price_text.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_remove_button.dart';
import 'cart_item.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    this.showAddRemoveButton = true,
    super.key,
  });
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(() {
      return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
          itemCount: cartController.cartItems.length,
          itemBuilder: (_, index) => Obx(() {
                final item = cartController.cartItems[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Ensures alignment within Column
                  children: [
                    TCartItem(cartItem: item), // Removed `const` here
                    if (showAddRemoveButton)
                      const SizedBox(height: TSizes.spaceBtwItem),
                    if (showAddRemoveButton)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 70,
                              ),
                              TProductQuantityWithAddAndRemoveIcon(
                                quantity: item.quantity,
                                add: () => cartController.addOneToCart(item),
                                remove: () =>
                                    cartController.removeOneFromCartItem(item),
                              ),
                            ],
                          ),
                          TProductPriceText(
                              price: (item.price * item.quantity)
                                  .toStringAsFixed(1)),
                        ],
                      ),
                  ],
                );
              }));
    });
  }
}
