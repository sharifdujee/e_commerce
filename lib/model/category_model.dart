class CategoryModel {
  final String title;
  final String? image, svgSrc;
  final List<CategoryModel>? subCategories;

  CategoryModel({
    required this.title,
    this.image,
    this.svgSrc,
    this.subCategories,
  });
}

final List<CategoryModel> demoCategoriesWithImage = [
  CategoryModel(title: "Woman’s", image: "https://poshgarments.com/wp-content/uploads/2021/10/Ladies-Dress-WWD0001.jpg"),
  CategoryModel(title: "Man’s", image: "https://deshigreetings.com/public/uploads/all/Rk5ouWVcTfmzFG5ck0p4CpW23HGJNYQV2zIVXGmZ.jpg"),
  CategoryModel(title: "Kid’s", image: "https://images-cdn.ubuy.co.id/653b9bf9eb16a54c387d5c7f-dhaka-border-nepali-dress-khadi-daura.jpg"),
  CategoryModel(title: "Accessories", image: "https://bournecrisp.com.au/wp-content/uploads/2019/07/accessories-make-or-break-1100x733.jpg"),
];

final List<CategoryModel> demoCategories = [
  CategoryModel(
    title: "On sale",
    svgSrc: "assets/icons/Sale.svg",
    subCategories: [
      CategoryModel(title: "All Clothing"),
      CategoryModel(title: "New In"),
      CategoryModel(title: "Coats & Jackets"),
      CategoryModel(title: "Dresses"),
      CategoryModel(title: "Jeans"),
    ],
  ),
  CategoryModel(
    title: "Man’s & Woman’s",
    svgSrc: "assets/icons/Man&Woman.svg",
    subCategories: [
      CategoryModel(title: "All Clothing"),
      CategoryModel(title: "New In"),
      CategoryModel(title: "Coats & Jackets"),
    ],
  ),
  CategoryModel(
    title: "Kids",
    svgSrc: "assets/icons/Child.svg",
    subCategories: [
      CategoryModel(title: "All Clothing"),
      CategoryModel(title: "New In"),
      CategoryModel(title: "Coats & Jackets"),
    ],
  ),
  CategoryModel(
    title: "Accessories",
    svgSrc: "assets/icons/Accessories.svg",
    subCategories: [
      CategoryModel(title: "All Clothing"),
      CategoryModel(title: "New In"),
    ],
  ),
];
