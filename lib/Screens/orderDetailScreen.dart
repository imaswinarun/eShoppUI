import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmaps_task/Utils/constants.dart';
import 'package:gmaps_task/models/orderDetailModel.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  static List<OrderDetailModel> orderDetail = Constants.orderDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: [
            Container(
              color: Colors.indigo[50],
            ),
            SingleChildScrollView(
              primary: true,
              child: Column(
                children: [
                  buildProductDetails(),
                  SizedBox(
                    height: 8.0,
                  ),
                  buildCustomerInfo(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget buildButton() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                shape: BoxShape.rectangle,
                color: Colors.red[300],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Reject Order',
                  style: TextStyle(
                      fontFamily: Constants.contentFontFamily,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                shape: BoxShape.rectangle,
                color: Constants.applicationBaseColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Accept Order',
                  style: TextStyle(
                      fontFamily: Constants.contentFontFamily,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Card buildCustomerInfo() {
    return Card(
      color: Colors.indigo[50],
      margin: const EdgeInsets.all(0.0),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildSelectedItem(),
            SizedBox(
              height: 8.0,
            ),
            buildShippingFee(),
            SizedBox(
              height: 16.0,
            ),
            buildSubTotal(),
            buildDivider(),
            Row(
              children: [
                Text(
                  "Customer Details",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constants.contentFontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            CustomerDetails("Name:", "Monica", ""),
            SizedBox(
              height: 8.0,
            ),
            CustomerDetails("Mobile No:", "+91 1234567890", ""),
            SizedBox(
              height: 8.0,
            ),
            CustomerDetails("Address:", "South Delhi", ""),
            SizedBox(
              height: 8.0,
            ),
            CustomerDetails("Payment:", "Online Payment", "Received"),
            buildDivider(),
            buildButton()
          ],
        ),
      ),
    );
  }

  ListView buildProductDetails() {
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            child: SizedBox(
              height: 8.0,
            ),
          );
        },
        itemCount: orderDetail.length,
        itemBuilder: (BuildContext context, int index) {
          return buildProductInfo(index);
        });
  }

  Column buildDivider() {
    return Column(
      children: [
        SizedBox(
          height: 8.0,
        ),
        Divider(
          color: Colors.black,
        ),
        SizedBox(
          height: 8.0,
        ),
      ],
    );
  }

  Widget CustomerDetails(String p1, String p2, String p3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            "$p1",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: Constants.contentFontFamily,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Text(
                "$p2",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: Constants.contentFontFamily,
                ),
              ),
              SizedBox(width: 5.0),
              p3 != ""
                  ? Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            shape: BoxShape.rectangle,
                            color: Colors.green[50]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 2.0, bottom: 2.0, left: 6.0, right: 6.0),
                          child: Text(
                            "$p3",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.green[900],
                              fontWeight: FontWeight.bold,
                              fontFamily: Constants.contentFontFamily,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ],
    );
  }

  Row buildSubTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            "Subtotal",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: Constants.contentFontFamily,
            ),
          ),
        ),
        Text(
          "Rs. 380",
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: Constants.contentFontFamily,
              color: Constants.applicationBaseColor),
        ),
      ],
    );
  }

  Row buildShippingFee() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            "Shipping Fee",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: Constants.contentFontFamily,
            ),
          ),
        ),
        Text(
          "Rs. 85",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: Constants.contentFontFamily,
              color: Constants.applicationBaseColor),
        ),
      ],
    );
  }

  Row buildSelectedItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            "Selected Items",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: Constants.contentFontFamily,
            ),
          ),
        ),
        Text(
          "Rs. 322",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: Constants.contentFontFamily,
              color: Constants.applicationBaseColor),
        ),
      ],
    );
  }

  Widget buildProductInfo(int index) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 6.0, bottom: 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.check_box_outlined,
                  color: Colors.grey,
                )),
            SizedBox(
              width: 6.0,
            ),
            Container(
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: 100.0,
                  width: 60.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: new AssetImage(
                            "assets/images/${orderDetail[index].productImg}"),
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 13.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "${orderDetail[index].productName}",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: Constants.contentFontFamily,
                          ),
                        ),
                      ),
                      Text(
                        "\t Rs ${orderDetail[index].productTotalPrice}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: Constants.contentFontFamily,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${orderDetail[index].productQty} Unit ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: Constants.contentFontFamily,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                shape: BoxShape.rectangle,
                                color: Colors.indigo[100]),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                '${orderDetail[index].productQty}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Constants.contentFontFamily,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            " X Rs ${orderDetail[index].productPrice}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: Constants.contentFontFamily,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Rs ${orderDetail[index].productTotalPrice}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: Constants.contentFontFamily,
                            color: Constants.applicationBaseColor),
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

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Constants.applicationBaseColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Constants.applicationBaseColor,
      ),
      title: Text(
        "ORDER NO - 134521",
        style: TextStyle(
          fontFamily: Constants.contentFontFamily,
        ),
      ),
    );
  }
}
