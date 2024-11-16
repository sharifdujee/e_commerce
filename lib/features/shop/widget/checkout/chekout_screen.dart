import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/custom_shape/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widget/success/success_screen.dart';
import 'package:e_commerce_app/features/personalization/controller/cart_controller/cart_controller.dart';
import 'package:e_commerce_app/features/personalization/controller/cart_controller/orderController.dart';
import 'package:e_commerce_app/features/shop/widget/cart/cart_items.dart';
import 'package:e_commerce_app/features/shop/widget/checkout/widget/billing_common_section/billing_amount_section.dart';
import 'package:e_commerce_app/features/shop/widget/checkout/widget/billing_common_section/billing_payment_section.dart';
import 'package:e_commerce_app/features/shop/widget/checkout/widget/billing_common_section/tbilling_address.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:e_commerce_app/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widget/product-cart/widget/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// cart Item
              const TCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// coupon
              const TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Billing section
              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    ///prcing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItem,
                    ),
                    Divider(),

                    ///Divider
                    SizedBox(
                      height: TSizes.spaceBtwItem,
                    ),

                    ///payment Methods

                    ///address
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItem,
                    ),
                    TBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            if (subTotal > 0) {
              orderController.processOrder(totalAmount);
            } else {
              TLoader.warningSnackBar(title: 'Empty cart', message: 'Add item to cart');
            }
          },
          child: Text('Checkout \$$totalAmount'),
        ),
      ),

    );
  }
}
