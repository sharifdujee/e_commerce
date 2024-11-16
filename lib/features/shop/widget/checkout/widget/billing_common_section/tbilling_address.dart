import 'package:e_commerce_app/features/personalization/screens/address/controller/address_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/widget/texts/section_heading.dart';
import '../../../../../../utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    //print('The id is ${addressController.selectedAddress.value.id}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () => addressController.selectNewAddressPopUp(context),
        ),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MD Robayet Bin Rahat',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItem,
                      ),
                      Text(
                        '+880 17901 010 417',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItem / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_history,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItem,
                      ),
                      Text(
                        'South Liana, Maine 87695, USA',
                        style: Theme.of(context).textTheme.bodyMedium,
                        softWrap: true,
                      )
                    ],
                  ),
                ],
              )
            : Text(
                'Select Address',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
      ],
    );
  }
}
