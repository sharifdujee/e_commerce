import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TCloudHelperFunction{

  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot){
    if(snapshot.connectionState == ConnectionState.waiting){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if(!snapshot.hasData || snapshot.data==null){
      return const Center(
        child: Text('No Data Found'),
      );

    }
    else if(snapshot.hasError){
      return const Center(
        child: Text('Something went wrong'),
      );
    }
    return null;
  }

  static Widget? checkMultiRecord<T>({
    required AsyncSnapshot<List<T>> snapShot,
    Widget? loader,
    Widget? error,
    Widget? nothingFound,
  }) {
    // Show loader if the connection is still waiting
    if (snapShot.connectionState == ConnectionState.waiting) {
      return loader ?? const Center(child: CircularProgressIndicator());
    }

    // Check for error and display error widget if any
    if (snapShot.hasError) {
      return error ?? const Center(child: Text('Something went wrong'));
    }

    // Check for empty data and display nothing found widget if no data is available
    if (!snapShot.hasData || snapShot.data!.isEmpty) {
      return nothingFound ?? const Center(child: Text('Nothing Found'));
    }

    // Return null when data is available
    return null;
  }


  static Future<String> getURLFromFilePathAndName(String path) async{
    try{
      if(path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    }
    on FirebaseException catch(e){
      throw e.message!;
    }
    on PlatformException catch(e){
      throw e.message!;
    }
    catch(e){
      throw 'SomeThing went Wrong';
    }

  }

}