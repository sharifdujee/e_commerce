import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/categories/category_repository.dart';
import 'package:e_commerce_app/data/repositories/products/product_repository.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/features/shop/model/category_model.dart';
import 'package:e_commerce_app/utils/helpers/firebase_storage.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:get/get.dart';


class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featureCategories = <CategoryModel>[].obs;
  final _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// load category data
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();
      //print("Fetched Categories: $categories");

      ///update the categories list
      allCategories.assignAll(categories);

      ///filter the categories
      featureCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
     // print("Filtered Categories: ${featureCategories.length}");
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  /// get category or sub category Products
 Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async{
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
 }

 /// sub categories
 Future<List<CategoryModel>> getSubCategories(String categoryId) async{

   try {
     final subCategories = await _categoryRepository.getSubCategories(categoryId);
     return subCategories;

     // print("Filtered Categories: ${featureCategories.length}");
   } catch (e) {
     TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
     return [];
   } finally {
     isLoading.value = false;
   }

 }
}
