class OrderHistoryModel {
  OrderHistoryModel({
    required this.orderNumber,
    required this.orderDate,
    required this.orderTime,
    required this.orderAmount,
    required this.orderStatus,
    required this.paymentStatus,
    required this.orderimg,
  });
  late final int orderNumber;
  late final String orderDate;
  late final String orderTime;
  late final int orderAmount;
  late final String orderStatus;
  late final String paymentStatus;
  late final String orderimg;

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    orderNumber = json['orderNumber'];
    orderDate = json['orderDate'];
    orderTime = json['orderTime'];
    orderAmount = json['orderAmount'];
    orderStatus = json['orderStatus'];
    paymentStatus = json['paymentStatus'];
    orderimg = json['orderimg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['orderNumber'] = orderNumber;
    _data['orderDate'] = orderDate;
    _data['orderTime'] = orderTime;
    _data['orderAmount'] = orderAmount;
    _data['orderStatus'] = orderStatus;
    _data['paymentStatus'] = paymentStatus;
    _data['orderimg'] = orderimg;
    return _data;
  }
}
