import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/authentication_repositories/authentication_repositories.dart';
import 'package:e_commerce_app/features/personalization/screens/address/model/address_model.dart';
import 'package:e_commerce_app/utils/helpers/full_screen_loader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../../../utils/constants/images_strings.dart';

class AddressRepository extends GetxController{
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw 'unable to find user information. try again later';
      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot)=>AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();

    }
    catch(e){
      throw 'Something went wrong while fetch the user address';
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress': selected});



    }
    catch(e){
      throw 'Unable to update you address section';
    }
  }

  /// add address
  Future<String> addAddress(AddressModel address) async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAddress.id;

    }
    catch(e){
      throw 'Something went wrong please try again later';
    }


  }
}