import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/model/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/exception_Handler/firebase_exception.dart';
import '../../../utils/helpers/exception_Handler/format_exception.dart';
import '../../../utils/helpers/exception_Handler/platform_exception.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///variables
  final _db = FirebaseFirestore.instance;

  /// get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list= snapshot.docs.map((document)=> CategoryModel.fromSnapshot(document)).toList();
      return list;

      
    } on FirebaseException catch (e) {
      print('error1${(e.code)} ');
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  /// get sub categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      print('Fetching subcategories with parentId: $categoryId');
      final snapshot = await _db.collection('Categories')
          .where('parentId', isEqualTo: categoryId)
          .get();

      if (snapshot.docs.isEmpty) {
        print('No documents found with parentId: $categoryId');
      }

      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      print('The subcategories products are $result');
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }




}
