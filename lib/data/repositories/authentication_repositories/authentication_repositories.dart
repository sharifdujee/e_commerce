import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentation/screens/login/login_screen.dart';
import 'package:e_commerce_app/features/authentation/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authentation/screens/sign_up/verify_email.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/helpers/exception_Handler/auth_exception.dart';
import '../../../utils/helpers/exception_Handler/firebase_exception.dart';
import '../../../utils/helpers/exception_Handler/format_exception.dart';
import '../../../utils/helpers/exception_Handler/platform_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;


  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
   final  user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {

        /// initialize user
        await TLocalStorage.init(user.uid);
        // Navigate to the main app screen if email is verified
        Get.offAll(() => const NavigationMenu());
      } else {
        // Redirect to email verification screen if not verified
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
      // Handle first-time or onboarding flow
      deviceStorage.writeIfNull('isFirstTime', true);
      bool isFirstTime = deviceStorage.read('isFirstTime') ?? true;
      if (isFirstTime) {
        Get.offAll(() => const OnboardingScreen());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    }
  }

  ///Email authentication
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.message ?? 'Authentication error');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Firebase error');
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.message ?? 'Platform error');
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong!. please try again';
    }
  }

  /// login function
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went Wrong,, please try again';
    }
  }

  /// google sign in
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('something went wrong ${e.toString()}');

      throw 'Something went Wrong,, please try again';
    }
  }

  /// reset password email

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong!. please try again';
    }
  }

  /// logout function
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong!. please try again';
    }
  }

  /// re-authenticate user
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async{
    try{

      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    }
    on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong!. please try again';
    }
  }


  /// deleteAccount
  Future<void> deleteAccount() async{
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();

    }
    on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong!. please try again';
    }
  }

  /// upload profike
}
