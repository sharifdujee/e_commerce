import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/repositories/authentication_repository.dart';
import 'package:e_commerce_admin_panel/model/auth/user_model.dart';
import 'package:get/get.dart';

import '../../../utils/helper/exception_handelr/firebase_exception.dart';
import '../../../utils/helper/exception_handelr/platform_exception.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async{
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());

    }
    on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }
    on TPlatformException catch(e){
      throw TPlatformException(e.message);
    }

    catch(e){
      throw 'Something went wrong';
    }
  }

  /// fetch user Details
  Future<UserModel> fetchAdminDetails() async{
    try{
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser!.uid).get();
        return UserModel.fromSnapshot(documentSnapshot);



    }
    on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }
    on TPlatformException catch(e){
      throw TPlatformException(e.message);
    }

    catch(e){
      throw 'Something went wrong';
    }

  }
}