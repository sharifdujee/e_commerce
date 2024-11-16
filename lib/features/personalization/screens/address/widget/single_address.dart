import 'package:e_commerce_app/common/widget/custom_shape/containers/rounded_container.dart';
import 'package:e_commerce_app/features/personalization/screens/address/controller/address_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/address/model/address_model.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.address, required this.onTap});

  final VoidCallback onTap;
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx((){
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress  = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          showBorder: true,
          width: double.infinity,
          backgroundColor: selectedAddress? TColors.primaryColor.withOpacity(0.5): Colors.transparent ,
          borderColor: selectedAddress? Colors.transparent: dark? TColors.darkerGrey: TColors.grey,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItem),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(selectedAddress?Iconsax.tick_circle:null,
                    color: selectedAddress? dark? TColors.light: TColors.dark:null),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(
                    height: TSizes.sm/2,
                  ),
                   Text(address.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis,),
                  const SizedBox(
                    height: TSizes.sm/2,
                  ),
                   Text(address.toString(), maxLines: 2, overflow: TextOverflow.ellipsis,softWrap: true,),
                ],
              )
            ],
          ),

        ),
      );
    }


    );
  }
}
