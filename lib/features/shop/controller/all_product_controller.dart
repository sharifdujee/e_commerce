import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/products/product_repository.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;

  final RxString selectedOptions = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  /// fetch all products
  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) {
        return [];
      }
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      TLoader.errorSnackBar(title: 'oh snap', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOptions) {
    selectedOptions.value = sortOptions;
    switch (sortOptions) {
      case "Name":
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Higher Price":
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case "Lower Price":
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case "Newest":
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case "Sale":
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products){
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
