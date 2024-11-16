import 'package:e_commerce_app/features/personalization/controller/cart_controller/checkout_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/address/controller/address_controller.dart';
import 'package:e_commerce_app/features/shop/controller/variation_controller.dart';
import 'package:get/get.dart';

import '../utils/helpers/network_manager.dart';

class GeneralBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }

}