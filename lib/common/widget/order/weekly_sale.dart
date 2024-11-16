import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../controller/dashboard_contrller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/devices_utils.dart';
import '../../rounded_container.dart';
import 'package:get/get.dart';
class TWeeklySaleGraph extends StatelessWidget {
  const TWeeklySaleGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashBoardController());
    return  TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Sales',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Graph
          SizedBox(
            height: 400,
            child: BarChart(BarChartData(
                titlesData: buildFlTitlesData(),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none),
                ),
                gridData: const FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    horizontalInterval: 200),
                barGroups: controller.weeklySales
                    .asMap()
                    .entries
                    .map((entry) => BarChartGroupData(
                    x: entry.key,
                    barRods: [
                      BarChartRodData(
                          width: 30,
                          toY: entry.value,
                          color: TColors.primaryColor,
                          borderRadius:
                          BorderRadius.circular(
                              TSizes.sm))
                    ]))
                    .toList(),
                groupsSpace: TSizes.spaceBtwItem,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) =>
                      TColors.secondaryColor),
                  touchCallback:
                  TDeviceUtils.isDesktopScreen(context)
                      ? (barTouchEvent,
                      barTouchResponse) {}
                      : null,
                ))),
          ),
        ],
      ),
    );
  }
  FlTitlesData buildFlTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta){
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

            ///calculate index
            final index = value.toInt() % days.length;

            final day = days[index];
            return SideTitleWidget(axisSide: AxisSide.bottom, space: 0,child: Text(day),);
          }
      )),
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true, interval: 200, reservedSize: 50)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),


    );
  }
}
