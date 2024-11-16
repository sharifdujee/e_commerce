import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/authentication_repositories/authentication_repositories.dart';
import 'package:get/get.dart';

import '../../../features/personalization/model/cart_model/order_model.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) {
        throw 'Unable to find user data';
      }

      final result = await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((documentSnapshot)=>OrderModel.fromSnapshot(documentSnapshot)).toList();

    }
    catch(e){
      throw 'Something went wrong';
    }

  }

  Future<void> saveOrder(OrderModel order, String userId) async{
    try{
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());

    }
    catch(e){
      throw 'Something wen t wrong while save the data';
    }

  }
}