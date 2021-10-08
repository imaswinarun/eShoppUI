import 'package:flutter/material.dart';
import 'package:gmaps_task/CustomLibraryClass/CustomNotificationBar/src/custom_navigation_bar_item.dart';
import 'package:gmaps_task/CustomLibraryClass/CustomNotificationBar/src/custome_navigation_bar.dart';
import 'package:gmaps_task/Utils/constants.dart';

import 'orderHistoryScreen.dart';

class HomeScreenBottomBar extends StatefulWidget {
  const HomeScreenBottomBar({Key? key}) : super(key: key);

  @override
  _HomeScreenBottomBarState createState() => _HomeScreenBottomBarState();
}

class _HomeScreenBottomBarState extends State<HomeScreenBottomBar> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderHistory(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return CustomNavigationBar(
      elevation: 10.0,
      iconSize: 30.0,
      selectedColor: Constants.applicationBaseColor,
      strokeColor: Color(0x30040307),
      unSelectedColor: Color(0xffacacac),
      backgroundColor: Colors.white,
      items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.home),
          titleText: "Home",
        ),
        CustomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            titleText: "Orders",
            badgeCount: 6,
            showBadge: true),
        CustomNavigationBarItem(
          icon: Icon(Icons.lightbulb_outline),
          titleText: "Products",
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.search),
          titleText: "Manage",
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          titleText: "Accounts",
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
