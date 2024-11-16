import 'package:e_commerce_app/features/shop/home/widget/home_screen.dart';
import 'package:e_commerce_app/features/shop/store/store.dart';
import 'package:e_commerce_app/features/shop/widget/wish_list/wish_list.dart';
import 'package:e_commerce_app/route/routes.dart';
import 'package:get/get.dart';

class AppRoutes{
   static final pages = [
   GetPage(name: TRoutes.home, page: ()=> const HomeScreen()),
     GetPage(name: TRoutes.favourites, page: ()=>const FavouriteScreen()),
     GetPage(name: TRoutes.store, page: ()=>const StoreScreen()),
   ];


}