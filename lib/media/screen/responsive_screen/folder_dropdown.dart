import 'package:e_commerce_admin_panel/common/binding/general_binding.dart';
import 'package:e_commerce_admin_panel/common/enum.dart';
import 'package:e_commerce_admin_panel/media/controller/media_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaFolderDropdown extends StatelessWidget {
  const MediaFolderDropdown({super.key, this.onChanged});

  final void Function(MediaCategory?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => SizedBox(
        width: 140,
        child: DropdownButtonFormField(
          isExpanded: false,
          value: controller.selectedPath.value,
          items: MediaCategory.values
              .map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.name.capitalize.toString())))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
