import 'package:data_table_2/data_table_2.dart';
import 'package:e_commerce_admin_panel/utils/constants/images_strings.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:e_commerce_admin_panel/utils/theme/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class TPaginatedDataTable extends StatelessWidget {
  const TPaginatedDataTable(
      {super.key,
      this.sortAscending = true,
      this.sortColumnIndex,
      this.rowPerPage = 10,
      required this.source,
      required this.column,
      this.onPageChanged,
      this.dataRowHeight = TSizes.xl * 2,
      this.tableHeight = 760,
      this.minWidth = 1000});

  final bool sortAscending;
  final int? sortColumnIndex;
  final int rowPerPage;
  final DataTableSource source;
  final List<DataColumn> column;
  final Function(int)? onPageChanged;
  final double dataRowHeight;
  final double tableHeight;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
          data: Theme.of(context).copyWith(
              cardTheme: const CardTheme(color: Colors.white, elevation: 0)),
          child: PaginatedDataTable2(
              columns: column,
              source: source,
            columnSpacing: 12,
            minWidth: minWidth,
            dividerThickness: 0,
            rowsPerPage: rowPerPage,
            showFirstLastButtons: true,
            showCheckboxColumn: true,
            sortAscending: sortAscending,
            onPageChanged: onPageChanged,
            dataRowHeight: dataRowHeight,
            renderEmptyRowsInTheEnd: false,
            onRowsPerPageChanged: (noOfRows){},
            sortColumnIndex: sortColumnIndex,
            headingTextStyle: Theme.of(context).textTheme.titleMedium,
            headingRowColor: WidgetStateProperty.resolveWith(
                    (states) => TColors.primaryBackground),
            headingRowDecoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(TSizes.borderRadiusMd),
                    topRight: Radius.circular(TSizes.borderRadiusMd))),
            empty: const TAnimationLoaderWidget(text: 'Nothing Found', animation: TImages.pencilAnimation),

            sortArrowBuilder: (bool ascending, bool sorted){
              if(sorted){
                return Icon(ascending? Iconsax.arrow_up_3: Iconsax.arrow_down, size: TSizes.iconSm,);
              }
              else{
                return const Icon(Iconsax.arrow_3, size: TSizes.iconSm,);
              }
            },


          ),
      ),
    );
  }
}
