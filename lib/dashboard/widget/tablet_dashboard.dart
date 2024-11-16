import 'package:e_commerce_admin_panel/common/rounded_container.dart';
import 'package:e_commerce_admin_panel/common/widget/order/order_status_pie_chart.dart';
import 'package:e_commerce_admin_panel/common/widget/order/weekly_sale.dart';
import 'package:flutter/material.dart';

import '../../common/widget/data_table/dashboard_order_table.dart';
import '../../utils/constants/sizes.dart';
import 'dashboard_card.dart';

class TabletDashboardScreen extends StatelessWidget {
  const TabletDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'DashBoard',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// card
            const Row(
              children: [
                Expanded(
                    child: TDashBoardCard(
                  stats: 25,
                  title: 'Sales Total',
                  subtitle: '\$365',
                )),
                SizedBox(
                  width: TSizes.spaceBtwItem,
                ),
                Expanded(
                    child: TDashBoardCard(
                  stats: 15,
                  title: 'Average Order Value',
                  subtitle: '\$25',
                )),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItem,
            ),

            const Row(
              children: [
                Expanded(
                    child: TDashBoardCard(
                  stats: 44,
                  title: 'Sales Orders',
                  subtitle: '\36',
                )),
                SizedBox(
                  width: TSizes.spaceBtwItem,
                ),
                Expanded(
                  child: TDashBoardCard(
                    stats: 2,
                    title: 'Visitors',
                    subtitle: '\25, 035',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const TWeeklySaleGraph(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// order table
            TRoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent Orders', style: Theme.of(context).textTheme.headlineSmall,),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const DashboardOrderTable(),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const OrderStatusPieChart(),
          ],
        ),
      ),
    ));
  }
}
