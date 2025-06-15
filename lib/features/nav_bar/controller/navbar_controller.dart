import 'package:business_app/features/cart/presentation/screen/cart_screen.dart';
import 'package:business_app/features/favourite/presentation/screen/favorite_screen.dart';
import 'package:get/get.dart';

import '../../home/presentation/screen/home_screen.dart';
import '../../profile/presentation/screen/profile_screen.dart';



class NavbarController extends GetxController {
  var currentIndex = 0.obs;

  final pages = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}