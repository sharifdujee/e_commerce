import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controller/cart_controller/cart_controller.dart';
import 'package:e_commerce_app/features/shop/widget/checkout/chekout_screen.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/helpers/animationLoader.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:get/get.dart';

import 'cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx((){
        final emptyWidget = TAnimationLoaderWidget(text: 'Whoops! cart is empty', animation: TImages.pencilAnimation,
        showAction: true,
        actionText: 'Let\'s fill it',
        onActionPressed: ()=> Get.off(()=> const NavigationMenu()),);
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: TCartItems(),
                    ),
          );
        }
      }
      ),
      bottomNavigationBar: controller.cartItems.isEmpty? const SizedBox(

      ):  Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=>Get.to(()=>const CheckoutScreen()), child:  Obx(()=> Text('Checkout \$${controller.totalCartPrice.value}'))),
      ),
    );
  }
}






