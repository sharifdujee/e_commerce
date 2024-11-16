import 'dart:convert';

import 'package:e_commerce_app/data/repositories/products/product_repository.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:e_commerce_app/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance =>Get.find();

  ///variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void initFavourites() {
    final json = TLocalStorage.instance().readData('favorites');

    if(json!=null){
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavourites.map((key, value)=>MapEntry(key, value as bool)));
    }


  }
  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  ///add
  void toggleFavoriteProducts(String productId) {
    if (favorites.containsKey(productId)) {
      // If the product is already in favorites, remove it
      favorites.remove(productId);  // Remove from the map
      saveFavoritesToStorage();  // Save updated favorites to local storage
      TLoader.customToast(message: 'Product has been removed from the Wishlist');
    } else {
      // If the product is not in favorites, add it
      favorites[productId] = true;  // Add to the map
      saveFavoritesToStorage();  // Save updated favorites to local storage
      TLoader.customToast(message: 'Product has been added to the Wishlist');
    }

    favorites.refresh();  // Refresh to update the UI
  }



  void saveFavoritesToStorage(){
    final encodedFavorite = json.encode(favorites);
    TLocalStorage.instance().writeData('favorites', encodedFavorite);

  }

  Future<List<ProductModel>> favouriteProducts() async{
    return await ProductRepository.instance.getFavouritesProducts(favorites.keys.toList());
  }


}