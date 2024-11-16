import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/screens/address/controller/address_controller.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Add New Address'),
      ),
      body:SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.addressFormKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value)=>TValidator.validateEmptyText('Name', value),
                controller: controller.name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Name'
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              TextFormField(
                validator: (value)=>TValidator.validatePhoneNumber(value),
                controller: controller.phoneNumber,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number'
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value)=>TValidator.validateEmptyText('Street', value),
                      controller: controller.street,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street'
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.defaultSpace,
                  ),
                  
                  Expanded(
                    child: TextFormField(
                      validator: (value)=>TValidator.validateEmptyText('Postal Code', value),
                      controller: controller.postalCode,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code'
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),

                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value)=>TValidator.validateEmptyText('City', value),
                      controller: controller.city,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City'
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.defaultSpace,
                  ),

                  Expanded(
                    child: TextFormField(
                      validator: (value)=>TValidator.validateEmptyText('State', value),
                      controller: controller.state,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State'
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),

                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              TextFormField(
                validator: (value)=>TValidator.validateEmptyText('Country', value),
                controller: controller.country,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country'
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields *2,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=>controller.addNewAddress(), child: const Text('Save')),
              ),




            ],
          ),
        ),),
      ) ,

    );
  }
}
