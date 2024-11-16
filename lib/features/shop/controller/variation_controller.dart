import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/features/personalization/model/product/produvt_variation_model.dart';
import 'package:e_commerce_app/features/shop/controller/images_controller.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxMap<String, dynamic> selectedAttributes = <String, dynamic>{}.obs;
  RxString variationStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// Called when an attribute is selected, updating the selected variation and image
  void onAttributeSelected(ProductModel product, String attributeName, dynamic attributeValue) {
    // Update the selected attribute locally
    selectedAttributes[attributeName] = attributeValue;

    // Find the variation that matches the currently selected attributes
    final matchingVariation = product.productsVariations?.firstWhere(
          (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    ) ?? ProductVariationModel.empty();

    // Update selected image if the matching variation has an image
    if (matchingVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = matchingVariation.image;
    }


    // Update selected variation and status
    selectedVariation.value = matchingVariation;
    updateVariationStatus();
  }

  /// Checks if the variation attributes match the selected attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  /// Retrieves available attribute values for a given attribute name from variations
  Set<String> getAvailableAttributeVariation(List<ProductVariationModel> variations, String attributeName) {
    return variations
        .where((variation) => variation.attributeValues[attributeName] != null && variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName]!)
        .toSet();
  }

  /// Updates the variation status based on stock availability
  void updateVariationStatus() {
    variationStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Resets selected attributes, status, and selected variation
  void resetSelectedVariation() {
    selectedAttributes.clear();
    variationStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

  /// get price
 String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0? selectedVariation.value.salePrice: selectedVariation.value.price).toString();
 }
}
