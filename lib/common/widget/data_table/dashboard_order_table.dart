import 'package:data_table_2/data_table_2.dart';
import 'package:e_commerce_admin_panel/common/widget/data_table/paginated_data_table.dart';
import 'package:e_commerce_admin_panel/common/widget/data_table/table_source.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DashboardOrderTable extends StatelessWidget {
  const DashboardOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
      minWidth: 700,
        tableHeight: 500,
        dataRowHeight: TSizes.xl * 1.2,
        source: OrderRows(),
        column: const [
          DataColumn2(label: Text('Order Id')),
          DataColumn2(label: Text('Date')),
          DataColumn2(label: Text('Items')),
          DataColumn2(label: Text('Status')),
          DataColumn2(label: Text('Amount')),
        ]);
  }
}
