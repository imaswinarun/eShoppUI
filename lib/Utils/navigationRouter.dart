import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmaps_task/Screens/orderDetailScreen.dart';

class MyNavigationRouter {
  void switchToOrderDetailScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => OrderDetailScreen()));
  }
}
