class OrderDetailModel {
  OrderDetailModel({
    required this.productName,
    required this.productPrice,
    required this.productQty,
    required this.productTotalPrice,
    required this.productImg,
  });
  late final String productName;
  late final int productPrice;
  late final int productQty;
  late final int productTotalPrice;
  late final String productImg;

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    productPrice = json['productPrice'];
    productQty = json['productQty'];
    productTotalPrice = json['productTotalPrice'];
    productImg = json['productImg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['productName'] = productName;
    _data['productPrice'] = productPrice;
    _data['productQty'] = productQty;
    _data['productTotalPrice'] = productTotalPrice;
    _data['productImg'] = productImg;
    return _data;
  }
}
