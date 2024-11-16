import 'package:e_commerce_admin_panel/common/enum.dart';
import 'package:e_commerce_admin_panel/utils/helper/helper.dart';

class OrderModel{
  String id;
  String? userId;
  OrderStatus status;
  double totalAmount;
  DateTime orderDate;
  DateTime? deliveryData;
  final String paymentMethod;

  OrderModel({
    required this.id,
    this.userId,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
     this.deliveryData,
    this.paymentMethod = 'Paypal'
});

  String get formatedOrderDate => THelperFunction.getFormattedDate(orderDate);
  String get formatedDeliveryDate => deliveryData !=null? THelperFunction.getFormattedDate(deliveryData!):'';

  String get orderStatusText => status == OrderStatus.delivered ? 'Delivered'
      : status == OrderStatus.shipped ? 'Shipment on the way': 'Processing';

  static OrderModel empty() => OrderModel(id: '', status: OrderStatus.pending, totalAmount: 0, orderDate: DateTime.now(),);

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'userId': userId,
       'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate,


          };
  }
}

