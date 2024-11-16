import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/personalization/model/product/brandModel.dart';
import 'package:e_commerce_app/utils/helpers/exception_Handler/firebase_exception.dart';
import 'package:e_commerce_app/utils/helpers/exception_Handler/format_exception.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// get all brands

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();

      /// print('Documents found: ${snapshot.docs.length}');
      for (var doc in snapshot.docs) {
        //print('Document data: ${doc.data()}');
      }

      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      //print('Parsed brand models: $result');
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw 'Something went wrong while fetching the brands';
    }
  }

  Future<List<BrandModel>> getBrandsForCategory( String categoryId) async {
    try {
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();
      print('brand category query $brandCategoryQuery');

      /// extract brand id
       List<String> brandIds = brandCategoryQuery.docs.map((doc)=>doc['brandId'] as String).toList();
      print('brand Id $brandIds');

       final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();
       print('brand wise query $brandsQuery');

       /// brand
      List<BrandModel> brands = brandsQuery.docs.map((doc)=>BrandModel.fromSnapshot(doc)).toList();
      print('the brand is $brands');
      return brands;




    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw 'Something went wrong while fetching the brands';
    }
  }
}
