import 'package:e_commerce_admin_panel/common/enum.dart';
import 'package:e_commerce_admin_panel/common/rounded_container.dart';
import 'package:e_commerce_admin_panel/controller/dashboard_contrller.dart';
import 'package:e_commerce_admin_panel/utils/constants/circular_container.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:e_commerce_admin_panel/utils/helper/helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderStatusPieChart extends StatelessWidget {
  const OrderStatusPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashBoardController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Orders', style: Theme.of(context).textTheme.headlineSmall,),
          const SizedBox(height: TSizes.spaceBtwSections,),
          /// Graph
          SizedBox(
            height: 400,
            child: PieChart(
              PieChartData(

                sections: controller.orderStatusData.entries.map((entry){
                  final  status  = entry.key;
                  final count = entry.value;
                  return PieChartSectionData(
                    title: count.toString(),
                    value: count.toDouble(),
                    radius: 100,
                    color: THelperFunction.getOrderStatusColor(status),

                    titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)

                  );

                }).toList(),
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse){

                  },
                  enabled: true,
                )
              )
            ),
          ),

          /// show Meta Data
          SizedBox(
            width: double.infinity,
            child: DataTable(columns: const [
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Orders')),
              DataColumn(label: Text('Total')),
            ],
              rows: controller.orderStatusData.entries.map((entry){
                final OrderStatus status  = entry.key;
                final int count = entry.value;
                final totalAmount = controller.totalAmount[status]??0;
                return DataRow(cells: [
                  DataCell(Row(
                    children: [
                      TCircularContainer(
                        width: 20,
                        height: 20,
                        backgroundColor: THelperFunction.getOrderStatusColor(status),
                      ),
                      const SizedBox( width: 5,),
                      Expanded(child: Text(controller.getDisplayedName(status)))
                    ],
                  )),
                  DataCell(Text(count.toString())),
                  DataCell(Text('\$${totalAmount.toStringAsFixed(2)}')),
                ]);

              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
