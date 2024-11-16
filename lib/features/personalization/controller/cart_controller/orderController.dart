import 'package:e_commerce_app/common/widget/success/success_screen.dart';
import 'package:e_commerce_app/data/repositories/authentication_repositories/authentication_repositories.dart';
import 'package:e_commerce_app/features/personalization/controller/cart_controller/cart_controller.dart';
import 'package:e_commerce_app/features/personalization/controller/cart_controller/checkout_controller.dart';
import 'package:e_commerce_app/features/personalization/model/cart_model/order_model.dart';
import 'package:e_commerce_app/features/personalization/screens/address/controller/address_controller.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/helpers/full_screen_loader.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/products/order_repository.dart';
import '../../../../utils/constants/images_strings.dart';
class OrderController extends GetxController{
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());


  /// fetch user order History
  Future<List<OrderModel>> fetchUserOrders() async{
    try{
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    }
    catch(e){
      TLoader.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  /// process order
  void processOrder(double totalAmount) async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing', TImages.pencilAnimation);
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) return;

      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          items: cartController.cartItems.toList(),
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address:  addressController.selectedAddress.value,
        deliveryDate: DateTime.now()
      );

      await orderRepository.saveOrder(order, userId);

      /// update
      cartController.clearCart();

      Get.off(()=>SuccessScreen(image: TImages.successAnimation, title: 'Payment Success', subTitle: 'Your Item will be shipped soon', onPressed: ()=>const NavigationMenu()));
    }
    catch(e){
      TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());


    }

  }
}