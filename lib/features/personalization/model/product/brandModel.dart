import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      this.isFeatured,
      this.productsCount});

  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  toJson() {
    return {
      "Id": id,
      "Name": name,
      "Image": image,
      "ProductsCount": productsCount,
      "IsFeatured": isFeatured
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? "",
      productsCount: data['ProductsCount']??0,
      isFeatured: data['IsFeatured'],
    );
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null && data.isNotEmpty) {
      //print('Document data for ${document.id}: $data'); // Debugging line to check data

      return BrandModel(
        id: document.id,
        name: data['Name'] ?? '', // Ensure correct field name
        image: data['Image'] ?? '', // Ensure correct field name
        productsCount: data['ProductsCount'] ?? 0, // Ensure correct field name
        isFeatured: data['IsFeatured'] ?? false, // Ensure correct field name
      );
    } else {
      //print('Empty or null data for document ID: ${document.id}');
      return BrandModel.empty(); // Return an empty model if data is null or empty
    }
  }


}
