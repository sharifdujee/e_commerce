import 'package:e_commerce_admin_panel/common/enum.dart';
import 'package:e_commerce_admin_panel/common/rounded_container.dart';
import 'package:e_commerce_admin_panel/common/rounded_image.dart';
import 'package:e_commerce_admin_panel/media/controller/media_controller.dart';
import 'package:e_commerce_admin_panel/media/screen/responsive_screen/folder_dropdown.dart';
import 'package:e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:e_commerce_admin_panel/utils/helper/devices_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

import '../../../utils/constants/images_strings.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return Obx(() => controller.shoeImageUploaderSection.value
        ? Column(
            children: [
              /// Drage and Drop
              TRoundedContainer(
                showBorder: true,
                height: 250,
                borderColor: TColors.borderPrimary,
                backgroundColor: TColors.primaryBackground,
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    Expanded(
                        child: Stack(
                      alignment: Alignment.center,
                      children: [
                        DropzoneView(
                            mime: ['image/jpeg', 'image/png'],
                            cursor: CursorType.Default,
                            operation: DragOperation.copy,
                            onLoaded: () => print('On Loaded'),
                            onError: (ev) => print('On Loaded $ev'),
                            onHover: () => print('On Loaded'),
                            onLeave: () => print('On Loaded'),
                            onCreated: (ctrl) =>
                                controller.dropzoneViewController = ctrl,
                            onDropFile: (file) {},
                            onDropInvalid: (ev) =>
                                print('zone invalid Mine $ev'),
                            onDropMultiple: (ev) =>
                                print('Zone Drop Multiple $ev')),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Image(
                              image:
                                  AssetImage(TImages.staticSuccessIllustration),
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItem,
                            ),
                            const Text('Drag and Drop Image Here'),
                            const SizedBox(
                              height: TSizes.spaceBtwItem,
                            ),
                            OutlinedButton(
                                onPressed: () {}, child: Text('Select Image'))
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),

              /// locally selected image
              const SizedBox(
                height: TSizes.spaceBtwItem,
              ),
              TRoundedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      /// Folders Drop down
                      children: [
                        Row(
                          children: [
                            ///Folders Drop down
                            Text(
                              'Select Folder',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              width: TSizes.spaceBtwItem,
                            ),
                            MediaFolderDropdown(
                              onChanged: (MediaCategory? newValue) {
                                if (newValue != null) {
                                  controller.selectedPath.value = newValue;
                                }
                              },
                            )
                          ],
                        ),

                        /// button
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text('Remove ALL')),
                            const SizedBox(
                              width: TSizes.spaceBtwItem,
                            ),
                            TDeviceUtils.isMobileScreen(context)
                                ? const SizedBox.shrink()
                                : SizedBox(
                                    width: TSizes.buttonWidth,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('Upload'))),
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: TSizes.spaceBtwItem / 2,
                            runSpacing: TSizes.spaceBtwItem / 2,
                            children: [
                              TRoundedImage(
                                width: 90,
                                height: 90,
                                padding: TSizes.sm,
                                imageType: ImageType.assets,
                                image: TImages.google,
                                //memoryImage: element.localImageTODisplay,
                                backgroundColor: TColors.primaryBackground,
                              ),
                              TRoundedImage(
                                width: 90,
                                height: 90,
                                padding: TSizes.sm,
                                imageType: ImageType.assets,
                                image: TImages.google,
                                //memoryImage: element.localImageTODisplay,
                                backgroundColor: TColors.primaryBackground,
                              ),
                              TRoundedImage(
                                width: 90,
                                height: 90,
                                padding: TSizes.sm,
                                imageType: ImageType.assets,
                                image: TImages.google,
                                //memoryImage: element.localImageTODisplay,
                                backgroundColor: TColors.primaryBackground,
                              ),
                              TRoundedImage(
                                width: 90,
                                height: 90,
                                padding: TSizes.sm,
                                imageType: ImageType.assets,
                                image: TImages.google,
                                //memoryImage: element.localImageTODisplay,
                                backgroundColor: TColors.primaryBackground,
                              ),
                              TRoundedImage(
                                width: 90,
                                height: 90,
                                padding: TSizes.sm,
                                imageType: ImageType.assets,
                                image: TImages.google,
                                //memoryImage: element.localImageTODisplay,
                                backgroundColor: TColors.primaryBackground,
                              ),
                              TRoundedImage(
                                width: 90,
                                height: 90,
                                padding: TSizes.sm,
                                imageType: ImageType.assets,
                                image: TImages.google,
                                //memoryImage: element.localImageTODisplay,
                                backgroundColor: TColors.primaryBackground,
                              ),
                              TRoundedImage(
                                width: 90,
                                height: 90,
                                padding: TSizes.sm,
                                imageType: ImageType.assets,
                                image: TImages.google,
                                //memoryImage: element.localImageTODisplay,
                                backgroundColor: TColors.primaryBackground,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TDeviceUtils.isMobileScreen(context)
                        ? SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('Upload')),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              )
            ],
          )
        : const SizedBox.shrink());
  }
}
