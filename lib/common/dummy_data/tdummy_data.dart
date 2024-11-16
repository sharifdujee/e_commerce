import 'package:e_commerce_app/features/shop/model/category_model.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';

class TDummyData{

  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronic', image: TImages.electronicIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetic', image: TImages.cosmeticIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewellery', image: TImages.jeweleryIcon, isFeatured: true),
    ///subCategory
    CategoryModel(id: '8', name: 'Sports Shoes', image: TImages.sportIcon, parentId: '1', isFeatured: false)



  ];


}