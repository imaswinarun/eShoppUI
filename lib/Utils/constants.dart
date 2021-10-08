import 'package:flutter/material.dart';
import 'package:gmaps_task/models/orderDetailModel.dart';
import 'package:gmaps_task/models/orderHistoryModel.dart';

class Constants {
  static final Color? iconUnselectedColor = Colors.grey[300];
  static final Color? iconSelectedColor = Colors.purple;
  static final Color? applicationBaseColor = Colors.deepPurpleAccent;
  static final double bottomNavigationIconSize = 45.0;
  static const String contentFontFamily = "Montserrat";
  static const String headerFontFamily = "Alata";
  static List<OrderHistoryModel> orders = [
    OrderHistoryModel(
        orderNumber: 134522,
        orderAmount: 72,
        orderDate: "8/11/2021",
        orderTime: "05:06 PM",
        orderStatus: "Pending",
        paymentStatus: "PAID",
        orderimg: "maggi.jpg"),
    OrderHistoryModel(
        orderNumber: 134521,
        orderAmount: 423,
        orderDate: "8/11/2021",
        orderTime: "05:01 PM",
        orderStatus: "Shipped",
        paymentStatus: "PAID",
        orderimg: "surf.jpg"),
    OrderHistoryModel(
        orderNumber: 134520,
        orderAmount: 290,
        orderDate: "8/11/2021",
        orderTime: "04:50 PM",
        orderStatus: "Accepted",
        paymentStatus: "PAID",
        orderimg: "surf2.jpg"),
    OrderHistoryModel(
        orderNumber: 134519,
        orderAmount: 198,
        orderDate: "8/11/2021",
        orderTime: "05:06 PM",
        orderStatus: "Accepted",
        paymentStatus: "PAID",
        orderimg: "dettol.jpg")
  ];
  static List<OrderDetailModel> orderDetail = [
    OrderDetailModel(
        productName: "Fortune Rozana Basmati Rice",
        productPrice: 67,
        productQty: 2,
        productTotalPrice: 134,
        productImg: "fortune.jpg"),
    OrderDetailModel(
        productName: "Unibic Assorted Cookies",
        productPrice: 188,
        productQty: 1,
        productTotalPrice: 188,
        productImg: "unibic.jpg"),
  ];
}
