import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/personalization/model/banner/banner_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/exception_Handler/firebase_exception.dart';
import '../../../utils/helpers/exception_Handler/format_exception.dart';
import '../../../utils/helpers/exception_Handler/platform_exception.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();


  /// variables
  final _db = FirebaseFirestore.instance;

  /// fetch all banner
  Future<List<BannerModel>> fetchBanners() async{
    try{
      final  result = await _db.collection('Banners').where('active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot)=>BannerModel.fromSnapshot(documentSnapshot)).toList();


    }
    on FirebaseException catch (e) {

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

