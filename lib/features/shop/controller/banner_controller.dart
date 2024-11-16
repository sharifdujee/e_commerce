import 'package:e_commerce_app/data/repositories/banner/banner_repository.dart';
import 'package:e_commerce_app/features/personalization/model/banner/banner_model.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/loader.dart';

class BannerController extends GetxController{


  /// variables
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchAllBanner();
    super.onInit();

  }

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }

  /// fetch The Banner
  Future<void> fetchAllBanner() async {
    try {
      isLoading.value = true;

      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      /// assign banner
      this.banners.assignAll(banners);


      // print("Filtered Categories: ${featureCategories.length}");
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}