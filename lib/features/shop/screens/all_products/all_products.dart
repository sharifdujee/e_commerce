import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/controller/all_product_controller.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/product-cart/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../personalization/model/product/product_model.dart';
import 'package:get/get.dart';
class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
 final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return  Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot){
              const loader = TVerticalCardShimmer();
             final widget  = TCloudHelperFunction.checkMultiRecord(snapShot: snapshot, loader: loader);
             if(widget!= null) return widget;
              final products = snapshot.data!;
              return  TSortableProduct(products:products,);
              },
              ),
        ),
      ),
    );
  }
}


