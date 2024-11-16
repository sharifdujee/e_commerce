import 'package:e_commerce_app/common/update_user_info/change_name.dart';
import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/images/tcircular_images.dart';
import 'package:e_commerce_app/common/widget/texts/section_heading.dart';
import 'package:e_commerce_app/features/authentation/screens/profile/widget/profile_menu.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/helpers/shimmer/simmer_effect.dart';
import '../../controller/user_controller/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: false,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            /// profile picture
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty, title: '',
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItem / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItem,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItem,
              ),

              ///=>Get.to(()=>const ChangeName()
              ProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              ProfileMenu(
                title: 'UserName',
                value: controller.user.value.username,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              const TSectionHeading(
                title: 'Personal  Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItem,
              ),
              ProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Date of Birth',
                value: '09-11-1997',
                onPressed: () {},
              ),

              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItem,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopUp(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),

          /// details
        ),
      ),
    );
  }
}
