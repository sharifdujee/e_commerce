class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  Map<String, dynamic> toJson() {
    return {"Name": name, "Value": values};
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    if (document.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: document["Name"] ?? '',
      values: document["Value"] != null
          ? List<String>.from(document["Value"])
          : [],
    );
  }
}
