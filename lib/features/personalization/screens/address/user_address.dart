import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/screens/address/add_new_address_screen.dart';
import 'package:e_commerce_app/features/personalization/screens/address/controller/address_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/address/widget/single_address.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class UserAddress extends StatelessWidget {
  const UserAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: TColors.primaryColor,
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppBar(
        title: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(()=>FutureBuilder(
                  key: Key(controller.refreshData.value.toString()),
                  future: controller.getAllUserAddress(),
                  builder: (context, snapshot) {
                    final response =
                        TCloudHelperFunction.checkMultiRecord(snapShot: snapshot);
                    if (response != null) return response;

                    final address = snapshot.data!;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: address.length,
                        itemBuilder: (_, index) => TSingleAddress(
                              address: address[index],
                              onTap: () =>
                                  controller.selectedAddresses(address[index]),
                            ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
