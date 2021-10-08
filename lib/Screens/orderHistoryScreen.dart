import 'package:flutter/material.dart';
import 'package:gmaps_task/Utils/constants.dart';
import 'package:gmaps_task/Utils/navigationRouter.dart';
import 'package:gmaps_task/models/orderHistoryModel.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(color: Colors.white, width: 3.0),
  );
  List<OrderHistoryModel> orders = Constants.orders;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildOrderHistoryAppBar(),
                buildOrder(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded buildOrder() {
    return Expanded(
      child: Card(
        color: Colors.indigo[50],
        margin: const EdgeInsets.all(0.0),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 20.0, right: 20.0, bottom: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Text(
                    'All Orders - 1543',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constants.contentFontFamily,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Constants.applicationBaseColor),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'All Times - 1543',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontFamily: Constants.contentFontFamily,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 130.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: Colors.indigo[100]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Today - 8',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: Constants.contentFontFamily,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_view_month_sharp,
                    color: Constants.applicationBaseColor,
                    size: 40.0,
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 12.0,
                      );
                    },
                    itemCount: orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildOrderInfo(index);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Card buildOrderInfo(int index) {
    return Card(
      color: Colors.white,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      )),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 50.0,
                  width: 40.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: new AssetImage(
                            "assets/images/${orders[index].orderimg}"),
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Oder No - ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: Constants.contentFontFamily,
                            ),
                          ),
                          Text(
                            "${orders[index].orderNumber}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: Constants.contentFontFamily,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Rs. ${orders[index].orderAmount}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: Constants.contentFontFamily,
                            color: Constants.applicationBaseColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${orders[index].orderDate}  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: Constants.contentFontFamily,
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "${orders[index].orderTime}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: Constants.contentFontFamily,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${orders[index].paymentStatus}",
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: Constants.contentFontFamily,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 5.0,
                            backgroundColor:
                                orders[index].orderStatus == "Pending"
                                    ? Colors.orange
                                    : orders[index].orderStatus == "Shipped"
                                        ? Colors.red
                                        : Constants.applicationBaseColor,
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            "${orders[index].orderStatus}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: orders[index].orderStatus == "Pending"
                                    ? Colors.orange
                                    : orders[index].orderStatus == "Shipped"
                                        ? Colors.red
                                        : Constants.applicationBaseColor),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          MyNavigationRouter()
                              .switchToOrderDetailScreen(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              shape: BoxShape.rectangle,
                              color: Colors.indigo[100]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 6.0, bottom: 6.0, left: 10.0, right: 10.0),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: Constants.contentFontFamily,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildOrderHistoryAppBar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          buildDashBoardBar(),
          SizedBox(
            height: 12.0,
          ),
          buildSearch(),
        ],
      ),
    );
  }

  Container buildSearch() {
    return Container(
      height: 60.0,
      child: Stack(
        children: [
          Container(
            child: TextFormField(
              onChanged: (value) {},
              onEditingComplete: () {},
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.indigo[50],
                  contentPadding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 20.0, right: 52.0),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  disabledBorder: outlineInputBorder,
                  hintText: 'Order id or Name',
                  hintStyle: TextStyle(
                    fontFamily: Constants.contentFontFamily,
                    color: Color(0xffacacac),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 51.0,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  color: Constants.applicationBaseColor),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildDashBoardBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: Color(0xffacacac),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.menu),
          ),
        ),
        Text(
          "bingo shop",
          style: TextStyle(
            color: Constants.applicationBaseColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: Constants.headerFontFamily,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.yellow[700]),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.menu),
          ),
        ),
      ],
    );
  }
}
