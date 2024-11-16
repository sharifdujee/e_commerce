import 'package:e_commerce_admin_panel/dashboard/screen/dashboard_screen.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/forget_passord/widget/forgot_password.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/login/widget/login_screen.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/screen/responsive_screen/widget/reset_password/widget/reset_password.dart';
import 'package:e_commerce_admin_panel/media/screen/media_screen.dart';
import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';

class TAppRoute{
  static final List<GetPage> pages = [

  // Main Pages

    GetPage(name: TRoutes.loginScreen, page: ()=>const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: ()=>const ForgotPasswordScreen()),
    GetPage(name: TRoutes.resetPassword, page: ()=>const ResetPasswordScreen()),

    /// dashboard
    GetPage(name: TRoutes.dashboard, page: ()=>const DashboardScreen(), ),
    GetPage(name: TRoutes.media, page: ()=> const MediaScreen())
    //middlewares: [TRouteMiddleWare()]
    //middlewares: [TRouteMiddleWare()]

  // Auth Pages
  /*GetPage(name: TRoutes.loginScreen, page: () => const LoginScreen()),
  GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
  GetPage(name: TRoutes.resetPassword, page: () => const ResetPasswordScreen()),

  // Dashboard
  GetPage(name: TRoutes.dashboard, page: () => const DashboardScreen(), middlewares: [TRouteMiddleWare()]),

  // Media
  GetPage(name: TRoutes.media, page: () => const MediaScreen(), middlewares: [TRouteMiddleWare()]),

  // Banners
  GetPage(name: TRoutes.banner, page: () => const BannerScreen(), middlewares: [TRouteMiddleWare()]),
  GetPage(name: TRoutes.createBanner, page: () => const CreateBannerScreen(), middlewares: [TRouteMiddleWare()]),
  GetPage(name: TRoutes.editBanner, page: () => const EditBannerScreen()),

  // Products
  GetPage(name: TRoutes.products, page: () => const ProductsScreen(), middlewares: [TRouteMiddleWare()]),
  GetPage(name: TRoutes.createProduct, page: () => const CreateProductScreen(), middlewares: [TRouteMiddleWare()]),
  GetPage(name: TRoutes.editProduct, page: () => const EditProductScreen(), middlewares: [TRouteMiddleWare()]),

  // Categories
  GetPage(name: TRoutes.categories, page: () => const CategoriesScreen(), middlewares: [TRouteMiddleWare()]),
  GetPage(name: TRoutes.createCategory, page: () => const CreateCategoryScreen(), middlewares: [TRouteMiddleWare()]),
  GetPage(name: TRoutes.editCategory, page: () => const EditCategoryScreen(), middlewares: [TRouteMiddleWare()]),

  // Brands
  GetPage(name: TRoutes.brands, page: () => const BrandsScreen(), middlewares: [TRouteMiddleWare()]),
  GetPage(name: TRoutes.createBrand, page: () => const CreateBrandScreen(), middlewares: [TRouteMiddleWare()]),
  GetPage(name: TRoutes.editBrand, page: () => const EditBrandScreen(), middlewares: [TRouteMiddleWare()]),

  // Users
  GetPage(name: TRoutes.users, page: () => const UsersScreen(), middlewares: [TRouteMiddleWare()]),
  GetPage(name: TRoutes.createUser, page: () => const CreateUserScreen(), middlewares: [TRouteMiddleWare()]),
  GetPage(name: TRoutes.editUser, page: () => const EditUserScreen(), middlewares: [TRouteMiddleWare()]),*/
  ];
  }

