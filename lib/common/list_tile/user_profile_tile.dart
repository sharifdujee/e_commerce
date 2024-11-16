import 'package:e_commerce_app/features/personalization/controller/user_controller/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/images_strings.dart';
import '../widget/images/tcircular_images.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        return TCircularImage(
          image: networkImage.isNotEmpty ? networkImage : TImages.user,
          height: 50,
          width: 50,
          padding: 0,
          isNetworkImage: networkImage.isNotEmpty, title: '', // Indicates whether to load as network image
        );
      }),

      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: ()=> Get.to(()=> const ProfileScreen()), icon: const Icon(Iconsax.edit, color: TColors.white,)),
    );
  }
}

