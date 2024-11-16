import 'package:e_commerce_admin_panel/features/feature_authentication/repositories/user_repository.dart';
import 'package:e_commerce_admin_panel/model/auth/user_model.dart';
import 'package:e_commerce_admin_panel/utils/theme/tloader.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;


  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  ///fetch user Details
  Future<UserModel> fetchUserDetails() async{
    try{
      loading.value = true;
      final user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      loading.value = false;
      return user;


    }
    catch(e){
      loading.value = false;
      TLoader.errorSnackBar(title: 'oh Snap', message: e.toString());
      return UserModel.empty();
    }
  }
}