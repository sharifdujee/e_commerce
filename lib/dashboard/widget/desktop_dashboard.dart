import 'package:data_table_2/data_table_2.dart';
import 'package:e_commerce_admin_panel/common/rounded_container.dart';
import 'package:e_commerce_admin_panel/common/widget/data_table/dashboard_order_table.dart';
import 'package:e_commerce_admin_panel/common/widget/order/order_status_pie_chart.dart';
import 'package:e_commerce_admin_panel/common/widget/order/weekly_sale.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/colors.dart';
import 'dashboard_card.dart';

class DesktopDashboardScreen extends StatelessWidget {
  const DesktopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
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
                    SizedBox(
                      width: TSizes.spaceBtwItem,
                    ),
                    Expanded(
                        child: TDashBoardCard(
                      stats: 44,
                      title: 'Sales Orders',
                      subtitle: '36',
                    )),
                    SizedBox(
                      width: TSizes.spaceBtwItem,
                    ),
                    TDashBoardCard(
                      stats: 2,
                      title: 'Visitors',
                      subtitle: '25, 035',
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ///Graphs
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                  Expanded(
                    flex: 2,
                    child: Column(children: [
                      const TWeeklySaleGraph(),

                      /// bar graph

                      const SizedBox(
                        height: TSizes.spaceBtwItem,
                      ),

                      ///order
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
                    ]),
                  ),
                      const SizedBox(
                        width: TSizes.spaceBtwItem,
                      ),
                  const Expanded(child: OrderStatusPieChart())
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*TextFormField(

                controller: controller.searchTextController,
                onChanged: (query)=> controller.searchQuery(query),
                decoration: const InputDecoration(hintText: 'Search', prefixIcon: Icon(Iconsax.search_normal)),

              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Obx((){
                Visibility(visible: false,child: Text(controller.filteredDataList.length.toString()),);
                return  Expanded(
                  child: TPaginatedDataTable(

                    dataRowHeight: 56,
                    onPageChanged: (value){},


                    /// sorting
                    sortAscending: controller.sortAscending.value,

                    sortColumnIndex: controller.sortColumnIndex.value,
                    column: [
                      const DataColumn2(label: Text('Column 1')),
                      DataColumn2(label: const Text('Column 2'), onSort: (columnIndex, ascending)=> controller.sortById(columnIndex, ascending)),
                      const DataColumn2(label: Text('Column 3')),
                      DataColumn2(label: const Text('Column 4'), onSort: (columnIndex, ascending)=> controller.sortById(columnIndex, ascending))
                    ],

                    source: MyData(),
                  ),
                );
              }*/

class MyData extends DataTableSource {
  final TDashBoardController controller = Get.put(TDashBoardController());

  @override
  DataRow? getRow(int index) {
    final data = controller.filteredDataList[index];
    return DataRow2(
        onTap: () {},
        selected: controller.selectedRows[index],
        onSelectChanged: (value) =>
            controller.selectedRows[index] = value ?? false,
        cells: [
          DataCell(Text(data['Column1'] ?? '')), // Corrected keys
          DataCell(Text(data['Column2'] ?? '')),
          DataCell(Text(data['Column3'] ?? '')),
          DataCell(Text(data['Column4'] ?? '')),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredDataList.length;

  @override
  int get selectedRowCount => 0;
}

class TDashBoardController extends GetxController {
  var filteredDataList = <Map<String, String>>[].obs;
  var dataList = <Map<String, String>>[].obs;
  RxList<bool> selectedRows = <bool>[].obs;
  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;
  final searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchDummyData();
  }

  void sortById(int sortColumIndex, bool ascending) {
    sortAscending.value = ascending;
    filteredDataList.sort((a, b) {
      if (ascending) {
        return filteredDataList[0]['Column1']
            .toString()
            .toLowerCase()
            .compareTo(filteredDataList[0]['Column1'].toString().toLowerCase());
      } else {
        return filteredDataList[0]['Column1']
            .toString()
            .toLowerCase()
            .compareTo(filteredDataList[0]['Column1'].toString().toLowerCase());
      }
    });
    this.sortColumnIndex.value = sortColumIndex;
  }

  void searchQuery(String query) {
    filteredDataList.assignAll(dataList
        .where((item) => item['Column1']!.contains(query.toLowerCase())));
  }

  void fetchDummyData() {
    selectedRows.assignAll(List.generate(36, (index) => false));

    dataList.addAll(List.generate(
      36,
      (index) => {
        'Column1': 'Data ${index + 1} -1',
        'Column2': 'Data ${index + 1} -2',
        'Column3': 'Data ${index + 1} -3',
        'Column4': 'Data ${index + 1} -4',
      },
    ));

    filteredDataList.addAll(List.generate(
      36,
      (index) => {
        'Column1': 'Data ${index + 1} -1',
        'Column2': 'Data ${index + 1} -2',
        'Column3': 'Data ${index + 1} -3',
        'Column4': 'Data ${index + 1} -4',
      },
    ));
  }
}
