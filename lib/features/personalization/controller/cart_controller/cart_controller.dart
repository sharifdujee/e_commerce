import 'package:e_commerce_app/features/personalization/model/cart_model/cart_item_model.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/features/shop/controller/variation_controller.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/helpers/loader.dart';
import 'package:e_commerce_app/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  ///variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController(){
    loadCartItems();
  }

  /// Add item to cart
  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      TLoader.customToast(message: 'Select Quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoader.customToast(message: 'Select Variation');
      return;
    }

    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        TLoader.warningSnackBar(
            title: 'Oh Snap!', message: 'Selected variation is out of stock');
        return;
      }
    } else {
      if (product.stock < 1) {
        TLoader.warningSnackBar(
            title: 'Oh Snap!', message: 'Selected Product is out of Stock');
        return;
      }
    }

    final selectedCartItem = convertedTOCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // Update quantity for existing item
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      // Add new item to the cart
      cartItems.add(selectedCartItem);
    }

    updateCart();
    TLoader.customToast(message: 'Your product has been added to the Cart');
  }



  /// add single item
  void addOneToCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    if(index >= 0){
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }


  void removeOneFromCartItem(CartItemModel item){
    int index = cartItems.indexWhere((cartItem)=>cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    if(index>=0){
      if(cartItems[index].quantity>1){
        cartItems[index].quantity -=1;
      }
      else{
        cartItems[index].quantity ==1? removeFromDialog(index): cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  /// pop
  void removeFromDialog(int index){
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: (){
        cartItems.removeAt(index);
        updateCart();
        TLoader.customToast(message: 'Product removed from the cart');
        Get.back();
      },
      onCancel: ()=> ()=> Get.back(),

    );
  }



  CartItemModel convertedTOCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) ;
    variationController.resetSelectedVariation();
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(productId: product.id,
        title: product.title,
        quantity: quantity,
       variationId: variation.id,
      image: isVariation?variation.image:product.thumbnail,
      brandName: product.brand!=null ? product.brand!.name:'',
      selectedVariation: isVariation? variation.attributeValues:null,
    );
  }

  updateCart(){
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }
  void updateCartTotals(){
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for(var item in cartItems){
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;

    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }
  void saveCartItems(){
    final cartItemStrings = cartItems.map((item)=>item.toJson()).toList();
    TLocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

  void loadCartItems(){
    final cartItemsStrings = TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if(cartItemsStrings!= null){
      cartItems.assignAll(cartItemsStrings.map((item)=>CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }

  }

  /// product quantity
   int getProductQuantityInCart(String productId){
    final foundItems = cartItems.where((item)=>item.productId == productId).fold(0, (previousValue, element)=> previousValue + element.quantity);
    return foundItems;
   }

   /// variation quantity
  int getVariationQuantityInCart(String productId, String variationId){
    final foundItem = cartItems.firstWhere((item)=>item.productId == productId && item.variationId == variationId,
    orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart(){
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product ){
    if(product.productType == ProductType.single.name){
      productQuantityInCart.value = getProductQuantityInCart(product.id);

    }
    else{
      final variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);

      }
      else{
        productQuantityInCart.value = 0;
      }
    }
  }
}
