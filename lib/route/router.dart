import 'package:e_commerce_ui/screen/address/views/addresses_screen.dart';
import 'package:e_commerce_ui/screen/checkout/views/cart_screen.dart';
import 'package:e_commerce_ui/screen/notification/view/enable_notification_screen.dart';
import 'package:e_commerce_ui/screen/notification/view/no_notification_screen.dart';
import 'package:e_commerce_ui/screen/notification/view/notification_ontions_screen.dart';
import 'package:e_commerce_ui/screen/notification/view/notificatios_screen.dart';
import 'package:e_commerce_ui/screen/order/views/orders_screen.dart';
import 'package:e_commerce_ui/screen/prefrences/views/preferences_screen.dart';
import 'package:e_commerce_ui/screen/profile/views/profile_screen.dart';
import 'package:e_commerce_ui/screen/user_info/view/user_info_screen.dart';
import 'package:e_commerce_ui/screen/wallet/views/empty_wallet_screen.dart';
import 'package:flutter/material.dart';

import '../entry_point.dart';
import '../screen/auth/views/login_screen.dart';
import '../screen/auth/views/password_recovery_screen.dart';
import '../screen/auth/views/signup_screen.dart';
import '../screen/bookmark/views/bookmark_screen.dart';
import '../screen/discover/views/discover_screen.dart';
import '../screen/home/views/home_screen.dart';
import '../screen/kids/views/kids_screen.dart';
import '../screen/on_sale/views/on_sale_screen.dart';
import '../screen/onboarding/views/onboarding_screen.dart';
import '../screen/product/views/product_details_screen.dart';
import '../screen/review/views/product_reviews_screen.dart';
import '../screen/search/views/search_screen.dart';
import '../screen/wallet/views/wallet_screen.dart';
import 'screen_export.dart';

// Yuo will get 50+ screens and more once you have the full template
// 🔗 Full template: https://theflutterway.gumroad.com/l/fluttershop

// NotificationPermissionScreen()
// PreferredLanguageScreen()
// SelectLanguageScreen()
// SignUpVerificationScreen()
// ProfileSetupScreen()
// VerificationMethodScreen()
// OtpScreen()
// SetNewPasswordScreen()
// DoneResetPasswordScreen()
// TermsOfServicesScreen()
// SetupFingerprintScreen()
// SetupFingerprintScreen()
// SetupFingerprintScreen()
// SetupFingerprintScreen()
// SetupFaceIdScreen()
// OnSaleScreen()
// BannerLStyle2()
// BannerLStyle3()
// BannerLStyle4()
// SearchScreen()
// SearchHistoryScreen()
// NotificationsScreen()
// EnableNotificationScreen()
// NoNotificationScreen()
// NotificationOptionsScreen()
// ProductInfoScreen()
// ShippingMethodsScreen()
// ProductReviewsScreen()
// SizeGuideScreen()
// BrandScreen()
// CartScreen()
// EmptyCartScreen()
// PaymentMethodScreen()
// ThanksForOrderScreen()
// CurrentPasswordScreen()
// EditUserInfoScreen()
// OrdersScreen()
// OrderProcessingScreen()
// OrderDetailsScreen()
// CancleOrderScreen()
// DelivereOrdersdScreen()
// AddressesScreen()
// NoAddressScreen()
// AddNewAddressScreen()
// ServerErrorScreen()
// NoInternetScreen()
// ChatScreen()
// DiscoverWithImageScreen()
// SubDiscoverScreen()
// AddNewCardScreen()
// EmptyPaymentScreen()
// GetHelpScreen()

// ℹ️ All the comments screen are included in the full template
// 🔗 Full template: https://theflutterway.gumroad.com/l/fluttershop

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case onbordingScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      );
    // case preferredLanuageScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const PreferredLanguageScreen(),
    //   );
    case logInScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case signUpScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );
    // case profileSetupScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const ProfileSetupScreen(),
    //   );
    case passwordRecoveryScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const PasswordRecoveryScreen(),
      );
    // case verificationMethodScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const VerificationMethodScreen(),
    //   );
    // case otpScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const OtpScreen(),
    //   );
    // case newPasswordScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const SetNewPasswordScreen(),
    //   );
    // case doneResetPasswordScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const DoneResetPasswordScreen(),
    //   );
    // case termsOfServicesScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const TermsOfServicesScreen(),
    //   );
    // case noInternetScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const NoInternetScreen(),
    //   );
    // case serverErrorScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const ServerErrorScreen(),
    //   );
    // case signUpVerificationScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const SignUpVerificationScreen(),
    //   );
    // case setupFingerprintScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const SetupFingerprintScreen(),
    //   );
    // case setupFaceIdScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const SetupFaceIdScreen(),
    //   );
    case productDetailsScreenRoute:
      return MaterialPageRoute(
        builder: (context) {
          bool isProductAvailable = settings.arguments as bool? ?? true;
          return ProductDetailsScreen(isProductAvailable: isProductAvailable);
        },
      );
    case productReviewsScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const ProductReviewsScreen(),
      );
    // case addReviewsScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const AddReviewScreen(),
    //   );
    case homeScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    // case brandScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const BrandScreen(),
    //   );
    // case discoverWithImageScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const DiscoverWithImageScreen(),
    //   );
    // case subDiscoverScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const SubDiscoverScreen(),
    //   );
    case discoverScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const DiscoverScreen(),
      );
    case onSaleScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const OnSaleScreen(),
      );
    case kidsScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const KidsScreen(),
      );
    case searchScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const SearchScreen(),
      );
    // case searchHistoryScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const SearchHistoryScreen(),
    //   );
    case bookmarkScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const BookmarkScreen(),
      );
    case entryPointScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const EntryPoint(),
      );
    case profileScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );
    // case getHelpScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const GetHelpScreen(),
    //   );
    // case chatScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const ChatScreen(),
    //   );
    case userInfoScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const UserInfoScreen(),
      );
    // case currentPasswordScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const CurrentPasswordScreen(),
    //   );
    // case editUserInfoScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const EditUserInfoScreen(),
    //   );
    case notificationsScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const NotificationsScreen(),
      );
    case noNotificationScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const NoNotificationScreen(),
      );
    case enableNotificationScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const EnableNotificationScreen(),
      );
    case notificationOptionsScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const NotificationOptionsScreen(),
      );
    // case selectLanguageScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const SelectLanguageScreen(),
    //   );
    // case noAddressScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const NoAddressScreen(),
    //   );
    case addressesScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const AddressesScreen(),
      );
    // case addNewAddressesScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const AddNewAddressScreen(),
    //   );
    case ordersScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const OrdersScreen(),
      );
    // case orderProcessingScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const OrderProcessingScreen(),
    //   );
    // case orderDetailsScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const OrderDetailsScreen(),
    //   );
    // case cancleOrderScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const CancleOrderScreen(),
    //   );
    // case deliveredOrdersScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const DelivereOrdersdScreen(),
    //   );
    // case cancledOrdersScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const CancledOrdersScreen(),
    //   );
    case preferencesScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const PreferencesScreen(),
      );
    // case emptyPaymentScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const EmptyPaymentScreen(),
    //   );
    case emptyWalletScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const EmptyWalletScreen(),
      );
    case walletScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const WalletScreen(),
      );
    case cartScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const CartScreen(),
      );
    // case paymentMethodScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const PaymentMethodScreen(),
    //   );
    // case addNewCardScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const AddNewCardScreen(),
    //   );
    // case thanksForOrderScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const ThanksForOrderScreen(),
    //   );
    default:
      return MaterialPageRoute(
        // Make a screen for undefine
        builder: (context) => const OnBoardingScreen(),
      );
  }
}