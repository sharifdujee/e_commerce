import 'package:e_commerce_app/common/widget/texts/section_heading.dart';
import 'package:e_commerce_app/data/repositories/address/address_repository.dart';
import 'package:e_commerce_app/features/personalization/screens/address/add_new_address_screen.dart';
import 'package:e_commerce_app/features/personalization/screens/address/model/address_model.dart';
import 'package:e_commerce_app/features/personalization/screens/address/widget/single_address.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper.dart';
import 'package:e_commerce_app/utils/helpers/full_screen_loader.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/images_strings.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
  final addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final postalCode = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;

  Future<List<AddressModel>> getAllUserAddress() async {
    try {
      final address = await addressRepository.fetchUserAddress();

      selectedAddress.value = address.firstWhere(
              (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());

      return address;
    } catch (e) {
      TLoader.errorSnackBar(title: 'Address not Found', message: e.toString());
      return [];
    }
  }

  /// selected Address
  Future selectedAddresses(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
      );

      /// clear the selector field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);

        /// assign new address
        newSelectedAddress.selectedAddress = true;
        selectedAddress.value = newSelectedAddress;

        /// selected address field update
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, true);
      }
    } catch (e) {
      TLoader.errorSnackBar(title: 'Error in selection', message: e.toString());
    }
  }

  /// Add new address
  Future addNewAddress() async {
    try {
      // Show loading dialog
      TFullScreenLoader.openLoadingDialog(
          'Storing Address', TImages.pencilAnimation);

      // Check network connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Validate form
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Create AddressModel instance
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
      );

      // Add address and set ID
      final id = await addressRepository.addAddress(address);
      address.id = id;

      // Call selected address callback
      await selectedAddress(address);

      // Stop loading dialog
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoader.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully');

      // Refresh data and reset form
      refreshData.toggle();
      resetFormFields();

      // Close dialog or screen
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Handle exceptions
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(
          title: 'Error',
          message: 'An error occurred while saving the address: $e');
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopUp(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows BottomSheet to take full height if needed
      builder: (_) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: TSizes.lg,
            right: TSizes.lg,
            top: TSizes.lg,
            bottom: MediaQuery.of(context).viewInsets.bottom + TSizes.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Let the Column shrink-wrap its content
            children: [
              const TSectionHeading(
                title: 'Select Address',
                showActionButton: false,
              ),
              FutureBuilder(
                future: getAllUserAddress(),
                builder: (_, snapshot) {
                  final response = TCloudHelperFunction.checkMultiRecord(
                      snapShot: snapshot);
                  if (response != null) return response;
                  return ListView.builder(
                    shrinkWrap: true, // Ensures ListView fits inside Column
                    physics: const NeverScrollableScrollPhysics(), // Disable ListView's own scroll
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (_, index) => TSingleAddress(
                      address: snapshot.data![index],
                      onTap: () async {
                        await selectedAddress(snapshot.data![index]);
                        Get.back();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: TSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const AddNewAddressScreen()),
                  child: const Text('Add New Address'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
