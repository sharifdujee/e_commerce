import 'package:e_commerce_app/features/personalization/controller/cart_controller/cart_controller.dart';
import 'package:e_commerce_app/features/shop/widget/cart/cart.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    super.key,   this.iconColor, this.counterBgColor, this.counterTextColor,

  });

  final Color? iconColor;
  final Color? counterBgColor;
  final Color? counterTextColor;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(CartController());
    final dark = THelperFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed:()=>Get.to(()=>const CartScreen()), icon:  Icon(Iconsax.shopping_bag, color: iconColor,)),
        Positioned(
          right: 0,

          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                color: counterBgColor??(dark? TColors.white : TColors.black),
                borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Obx(()=> Text(controller.noOfCartItems.value.toString(), style: Theme.of(context).textTheme.labelLarge!.apply(
                    color:counterTextColor??(dark?TColors.black:TColors.white),
                    fontSizeFactor: 0.8
                ),),
              ),
            ),
          ),
        ),

      ],
    );
  }
}