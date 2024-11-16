import 'package:e_commerce_admin_panel/features/feature_authentication/controller/user_controller.dart';
import 'package:e_commerce_admin_panel/utils/helper/network_manager.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(()=> NetworkManager(), fenix: true);
    Get.lazyPut(()=> UserController(), fenix: true);

  }
}