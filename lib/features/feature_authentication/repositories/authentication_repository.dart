import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:e_commerce_admin_panel/utils/helper/exception_handelr/auth_exception.dart';
import 'package:e_commerce_admin_panel/utils/helper/exception_handelr/firebase_exception.dart';
import 'package:e_commerce_admin_panel/utils/helper/exception_handelr/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/helper/exception_handelr/format_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Firebase auth instance
  final _auth = FirebaseAuth.instance;

  /// Get authenticated user
  User? get authUser => _auth.currentUser;

  /// Check authentication status
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
    screenRedirect();
   super.onReady();
  }

  void printCurrentUserData() {
    final user = authUser;
    if (user != null) {
      print("User ID: ${user.uid}");
    } else {
      print("No user is currently signed in.");
    }
  }

  /// Redirection screen
  void screenRedirect() async {
    final user = _auth.currentUser;
   // print('the current user is ${user!.uid}');
    if (user != null) {
      print("Navigating to dashboard...");
      Get.offAllNamed(TRoutes.dashboard);
    } else {
      print("Navigating to login screen...");
      Get.offAllNamed(TRoutes.loginScreen);
    }
  }


  /// Login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.message);
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  /// Admin register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.message);
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(TRoutes.loginScreen);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }
}