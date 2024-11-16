import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/rounded_container.dart';
import '../../common/widget/data_table/dashboard_order_table.dart';
import '../../common/widget/order/order_status_pie_chart.dart';
import '../../common/widget/order/weekly_sale.dart';
import '../../utils/constants/sizes.dart';
import 'dashboard_card.dart';
import 'desktop_dashboard.dart';

class MobileDashboardScreen extends StatelessWidget {
  const MobileDashboardScreen({super.key});

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
                const TDashBoardCard(
                  stats: 25,
                  title: 'Sales Total',
                  subtitle: '\$365',
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItem,
                ),
                const TDashBoardCard(
                  stats: 15,
                  title: 'Average Order Value',
                  subtitle: '\$25',
                ),
                const SizedBox(height: TSizes.spaceBtwItem,),

                const SizedBox(
                  height: TSizes.spaceBtwItem,
                ),
                const TDashBoardCard(
                  stats: 44,
                  title: 'Sales Orders',
                  subtitle: '\36',
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItem,
                ),
                const TDashBoardCard(
                  stats: 2,
                  title: 'Visitors',
                  subtitle: '25, 035',
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TWeeklySaleGraph(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TRoundedContainer(),

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
