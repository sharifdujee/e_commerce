import 'package:e_commerce_app/common/widget/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/model/cart_model/payment_model.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../screens/address/widget/payment_tile.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: TImages.payPal);
    super.onInit();
  }

  /// select other payment method
  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(TSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSectionHeading(
                      title: 'Select Payment Method',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    /// change the image later
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Paypal', image: TImages.payPal)),
                    const SizedBox(
                      height: TSizes.spaceBtwItem / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Google Pay', image: TImages.googlePay)),
                    const SizedBox(
                      height: TSizes.spaceBtwItem / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Apple Pay', image: TImages.applePay)),
                    const SizedBox(
                      height: TSizes.spaceBtwItem / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'ViSA', image: TImages.visaCard)),
                    const SizedBox(
                      height: TSizes.spaceBtwItem / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Master Card', image: TImages.mastersCard)),
                    const SizedBox(
                      height: TSizes.spaceBtwItem / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Paytm', image: TImages.payTm)),
                    const SizedBox(
                      height: TSizes.spaceBtwItem / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'PayStack', image: TImages.payStack)),
                    const SizedBox(
                      height: TSizes.spaceBtwItem / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Credit Card', image: TImages.creditCard)),
                    const SizedBox(
                      height: TSizes.spaceBtwItem / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Mobile Banking', image: TImages.mobileBanking)),
                  ],
                ),
              ),
            ));
  }
}
