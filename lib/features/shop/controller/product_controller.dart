import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:get/get.dart';

import '../../../data/repositories/products/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  /// variables
  RxList<ProductModel> featuresProducts = <ProductModel>[].obs;
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());

  @override
  Future<void> onInit() async {
    fetchFeatureProducts();
    super.onInit();
  }

  void fetchFeatureProducts() async {
    try {
      isLoading.value = true;

      ///fetch products
      final products = await productRepository.getFeaturedProducts();
      //print('Fetched Products: $products');
      featuresProducts.assignAll(products);
      //print('featuresProducts in UI: ${featuresProducts.length}');
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      //print('The exception is ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeatureProducts() async {
    try {
      isLoading.value = true;

      ///fetch products
      final products = await productRepository.getFeaturedProducts();
      //print('Fetched Products: $products');
      return products;
      //print('featuresProducts in UI: ${featuresProducts.length}');
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      //print('The exception is ${e.toString()}');
      return [];
    }
  }

  ///get product price
  String getProductPrice(ProductModel product) {
    double? minPrice;
    double? maxPrice;

    // Correct the typo: Ensure that ProductType is recognized correctly
    if (product.productType == ProductType.single.name) {
      // For single products, use salePrice if available; otherwise, use the regular price
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else if (product.productType == ProductType.variable.name &&
        product.productsVariations != null &&
        product.productsVariations!.isNotEmpty) {
      // Loop through each variation to find valid prices (greater than 0.0)
      for (var variation in product.productsVariations!) {
        double regularPrice = variation.price;
        double salePrice =
            variation.salePrice > 0 ? variation.salePrice : regularPrice;

        // Update minPrice and maxPrice based on the variation prices
        if (regularPrice > 0) {
          minPrice = (minPrice == null || regularPrice < minPrice)
              ? regularPrice
              : minPrice;
          maxPrice = (maxPrice == null || regularPrice > maxPrice)
              ? regularPrice
              : maxPrice;
        }
        if (salePrice > 0) {
          minPrice =
              (minPrice == null || salePrice < minPrice) ? salePrice : minPrice;
          maxPrice =
              (maxPrice == null || salePrice > maxPrice) ? salePrice : maxPrice;
        }
      }

      // Display price range or single price if minPrice == maxPrice
      if (minPrice != null && maxPrice != null) {
        return minPrice == maxPrice
            ? maxPrice.toString()
            : '$minPrice - $maxPrice';
      }
    }

    // Fallback to base price if no valid variation prices are found
    return product.price.toString();
  }

  /// calculate sale percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// get stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
