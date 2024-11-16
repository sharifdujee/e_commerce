import 'package:e_commerce_admin_panel/common/enum.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/model/order_model.dart';
import 'package:e_commerce_admin_panel/utils/helper/helper.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController{
  static DashBoardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;
  static final List<OrderModel> orders = [
    OrderModel(id: 'Apple', status: OrderStatus.pending, totalAmount: 65,orderDate: DateTime(2024, 11,10), deliveryData: DateTime(2024, 11,16)),
    OrderModel(id: 'Nike', status: OrderStatus.processing, totalAmount: 165,orderDate: DateTime(2024, 11,11), deliveryData: DateTime(2024, 11,16)),
    OrderModel(id: 'Adidas', status: OrderStatus.shipped, totalAmount: 25,orderDate: DateTime(2024, 11,12), deliveryData: DateTime(2024, 11,16)),
    OrderModel(id: 'Real Madrid', status: OrderStatus.delivered, totalAmount: 28,orderDate: DateTime(2024, 11,13), deliveryData: DateTime(2024, 11,16)),
    OrderModel(id: 'Zara', status: OrderStatus.delivered, totalAmount: 265,orderDate: DateTime(2024, 11,14), deliveryData: DateTime(2024, 11,16)),
    OrderModel(id: 'Aaron', status: OrderStatus.canceled, totalAmount: 120,orderDate: DateTime(2024, 11,15), deliveryData: DateTime(2024, 11,16)),
    OrderModel(id: 'Test', status: OrderStatus.shipped, totalAmount: 185,orderDate: DateTime(2024, 11,16), deliveryData: DateTime(2024, 11,16)),

  ];

  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int> {}.obs;
  final RxMap<OrderStatus, double> totalAmount = <OrderStatus, double> {}.obs;


  @override
  void onInit() {
    _calculateWeeklySales();
    _calculateOrderStatusData();
    super.onInit();
  }

  void _calculateWeeklySales(){
    weeklySales.value = List<double>.filled(7, 0.0);
    for(var order in orders){
      final DateTime orderWeekStart = THelperFunction.getStartOfWeek(order.orderDate);

      /// current week order
      if(orderWeekStart.isBefore(DateTime.now()) && orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())){
         int index = (order.orderDate.weekday -1) % 7;
         /// non -negative
        index = index<0? index +7: index;
        weeklySales[index] += order.totalAmount;

        //print('orderDate ${order.orderDate}, currentWeekDay  $orderWeekStart, index: $index');
      };
    }
   // print('Wekly sales : $weeklySales');

  }

  void _calculateOrderStatusData(){
    /// reset data
    orderStatusData.clear();
    /// map to store total amounts
    totalAmount.value = {for(var status in OrderStatus.values) status : 0.0};

    for(var order in orders){
      /// count orders
       final status = order.status;
      orderStatusData[status] = (orderStatusData[status]??0) +1;

      /// calculate total amounts
      totalAmount[status] = (totalAmount[status]??0) + order.totalAmount;
    }



  }

  String getDisplayedName(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';

      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.canceled:
        return 'Canceled';
      default:
        return 'Unknown';
    }
  }
}