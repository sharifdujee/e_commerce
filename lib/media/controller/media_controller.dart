
import 'package:e_commerce_admin_panel/common/enum.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class MediaController extends GetxController{
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneViewController;
  final RxBool shoeImageUploaderSection = false.obs;

  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
}