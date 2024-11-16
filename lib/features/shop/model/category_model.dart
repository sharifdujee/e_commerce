import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String parentId;
  final bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  /// Empty CategoryModel instance
  static CategoryModel empty() => CategoryModel(
      id: '', name: '', image: '', isFeatured: false);

  /// Convert model to JSON for saving to Firestore
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'parentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  /// Map Firestore document to CategoryModel instance
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['parentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }

  /// Provide a readable output for debugging
  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image, parentId: $parentId, isFeatured: $isFeatured)';
  }
}
