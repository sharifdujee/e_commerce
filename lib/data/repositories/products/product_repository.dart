import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/utils/helpers/exception_Handler/firebase_exception.dart';
import 'package:e_commerce_app/utils/helpers/exception_Handler/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => ProductRepository();

  final _db = FirebaseFirestore.instance;

  /// get all Products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      /// need to change the name
      final snapShot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      //print('The data count is ${snapShot.docs.length}');
      for (var doc in snapShot.docs) {
        //print('Document data: ${doc.data()}');
      }

      return snapShot.docs
          .map((e) => ProductModel.fromQuerySnapshot(e))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      print('The exception is ${e.toString()}');
      throw 'Something went wrong';
    }
  }

  ///
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      /// need to change the name
      final snapShot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      //print('The data count is ${snapShot.docs.length}');
      for (var doc in snapShot.docs) {
        //print('Document data: ${doc.data()}');
      }

      return snapShot.docs
          .map((e) => ProductModel.fromQuerySnapshot(e))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      print('The exception is ${e.toString()}');
      throw 'Something went wrong';
    }
  }

  /// fetch product by query

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      //print('The exception is ${e.toString()}');
      throw 'Something went wrong';
    }
  }

  /// get products by Brand Id
   Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit= -1}) async{
    try{

      final querySnapshot = limit == -1? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get():
      await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();
      final products = querySnapshot.docs.map((doc)=>ProductModel.fromQuerySnapshot(doc)).toList();
      return products;


    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      print('The exception is ${e.toString()}');
      throw 'Something went wrong';
    }

   }

   /// product by category
  Future<List<ProductModel>> getProductsForCategory ({required String categoryId, int limit= -1}) async{
    try{

      final productCategoryQuery = limit == -1? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get():
      await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      List<String> productIds = productCategoryQuery.docs.map((doc)=> doc['productId'] as String).toList();
       final productQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
       List<ProductModel> products = productQuery.docs.map((doc)=>ProductModel.fromSnapshot(doc)).toList();
      return products;


    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      //print('The exception is ${e.toString()}');
      throw 'Something went wrong';
    }

  }


  /// get favourite Products
  Future<List<ProductModel>> getFavouritesProducts(List<String> productIds) async{

    try{
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((querySnapshot)=> ProductModel.fromSnapshot(querySnapshot)).toList();


    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TargetPlatformException(e.code).message;
    } catch (e) {
      //print('The exception is ${e.toString()}');
      throw 'Something went wrong';
    }

  }

}

