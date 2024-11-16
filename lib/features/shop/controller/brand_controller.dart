import 'package:e_commerce_app/data/repositories/brand/brand_repository.dart';
import 'package:e_commerce_app/data/repositories/products/product_repository.dart';
import 'package:e_commerce_app/features/personalization/model/product/brandModel.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:get/get.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  RxBool isLoading = false.obs;
  final RxList<BrandModel> featuredBrand = <BrandModel>[].obs;
  final RxList<BrandModel> allBrand = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();

  }


  /// load all brands
  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();
      allBrand.assignAll(brands); // Assign all brands
      featuredBrand.assignAll(brands); // Use all brands, not just featured
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false; // Ensure loading is set to false
    }
  }


/// get brands by category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId)async{
    try{
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    }
    catch(e){
      TLoader.errorSnackBar(title: 'oh Snap!', message: e.toString());
      return [];
    }
  }
/// get brands specifics  products
  Future<List<ProductModel>> getBrandProducts({ required String brandId, int limit = -1}) async{
    try{
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    }
    catch(e){
      TLoader.errorSnackBar(title: 'oh Snap', message: e.toString());
      return [];
    }
  }

}