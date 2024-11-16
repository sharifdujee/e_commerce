import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/authentication_repositories/authentication_repositories.dart';
import 'package:e_commerce_app/features/authentation/model/user/user_model.dart';
import 'package:e_commerce_app/utils/helpers/exception_Handler/firebase_exception.dart';
import 'package:e_commerce_app/utils/helpers/exception_Handler/format_exception.dart';
import 'package:e_commerce_app/utils/helpers/exception_Handler/platform_exception.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.put(UserRepository());
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  /// save user record
  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());

    }
    on FirebaseException catch(e){
      print('error1${(e.code)} ');
      throw TFirebaseException(e.code).message;

    }
    on FormatException catch(_){

      throw const TFormatException();
    }
    on PlatformException catch(e){
      print('error2${(e.code)} ');

      throw TargetPlatformException(e.code).message;
    }
    catch(e){
      print('overall${(e.toString())} ');
      throw 'Something went wrong. please try again';
    }

  }


  /// fetch user Data
  Future<UserModel> fetchUserDetails() async{
    try{
   final documentSnapShot =    await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
     if(documentSnapShot.exists){
       return UserModel.fromSnapshot(documentSnapShot);

     }
     else{
       return UserModel.empty();
     }

    }
    on FirebaseException catch(e){
      print('error1${(e.code)} ');
      throw TFirebaseException(e.code).message;

    }
    on FormatException catch(_){

      throw const TFormatException();
    }
    on PlatformException catch(e){
      print('error2${(e.code)} ');

      throw TargetPlatformException(e.code).message;
    }
    catch(e){
      print('overall${(e.toString())} ');
      throw 'Something went wrong. please try again';
    }

  }

  Future<void> updateUserDetails(UserModel updateUser) async{
    try{
      await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson());

    }
    on FirebaseException catch(e){
      print('error1${(e.code)} ');
      throw TFirebaseException(e.code).message;

    }
    on FormatException catch(_){

      throw const TFormatException();
    }
    on PlatformException catch(e){
      print('error2${(e.code)} ');

      throw TargetPlatformException(e.code).message;
    }
    catch(e){
      print('overall${(e.toString())} ');
      throw 'Something went wrong. please try again';
    }
  }

  /// update single Field
  Future<void> updateSingleField(Map<String, dynamic> json) async{
    try{
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);

    }
    on FirebaseException catch(e){
      print('error1${(e.code)} ');
      throw TFirebaseException(e.code).message;

    }
    on FormatException catch(_){

      throw const TFormatException();
    }
    on PlatformException catch(e){
      print('error2${(e.code)} ');

      throw TargetPlatformException(e.code).message;
    }
    catch(e){
      print('overall${(e.toString())} ');
      throw 'Something went wrong. please try again';
    }
  }

  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection('Users').doc(userId).delete();

    }
    on FirebaseException catch(e){
      print('error1${(e.code)} ');
      throw TFirebaseException(e.code).message;

    }
    on FormatException catch(_){

      throw const TFormatException();
    }
    on PlatformException catch(e){
      print('error2${(e.code)} ');

      throw TargetPlatformException(e.code).message;
    }
    catch(e){
      print('overall${(e.toString())} ');
      throw 'Something went wrong. please try again';
    }
  }

  /// upload profile picture
   Future<String> uploadImage(String path, XFile image) async{


    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;

   }
    on FirebaseException catch(e){
      print('error1${(e.code)} ');
      throw TFirebaseException(e.code).message;

    }
    on FormatException catch(_){

      throw const TFormatException();
    }
    on PlatformException catch(e){
      print('error2${(e.code)} ');

      throw TargetPlatformException(e.code).message;
    }
    catch(e){
      print('overall${(e.toString())} ');
      throw 'Something went wrong. please try again';
    }
   }
}