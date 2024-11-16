import 'package:data_table_2/data_table_2.dart';
import 'package:e_commerce_admin_panel/common/rounded_container.dart';
import 'package:e_commerce_admin_panel/controller/dashboard_contrller.dart';
import 'package:e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:e_commerce_admin_panel/utils/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderRows extends DataTableSource {
  final controller = DashBoardController.instance;
  @override
  DataRow? getRow(int index) {
    final order = DashBoardController.orders[index];
    // TODO: implement getRow
    return  DataRow2(cells: [
      DataCell(Text(
        order.id,
        style: Theme.of(Get.context!)
            .textTheme
            .bodyLarge!
            .apply(color: TColors.primaryColor),
      )),
      DataCell(Text(order.formatedOrderDate)),
      const DataCell(Text('5 Items')),
      DataCell(TRoundedContainer(
        radius: TSizes.cardRadiusSm,
        padding: const EdgeInsets.symmetric(vertical: TSizes.xs, horizontal: TSizes.md),
        backgroundColor: THelperFunction.getOrderStatusColor(order.status).withOpacity(0.1),
        child: Text(order.status.name.capitalize.toString(),
        style: TextStyle(color: THelperFunction.getOrderStatusColor(order.status)),),
      )),
      DataCell(Text('\$${order.totalAmount}'))

    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => DashBoardController.orders.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
