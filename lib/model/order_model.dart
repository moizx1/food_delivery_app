class OrderModel {
  List? cartList;
  int? totalPrice;
  String? chooseDeliveryMethod;
  Map<String, bool>? deliveryMethod;
  Map<String, bool>? paymentMethod;

  OrderModel({
    this.cartList,
    this.totalPrice,
    this.deliveryMethod,
    this.paymentMethod,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    cartList = json['cartList'];
    totalPrice = json['totalPrice'];
    deliveryMethod = json['deliveryMethod'];
    paymentMethod = json['paymentMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartList'] = this.cartList;
    data['totalPrice'] = this.totalPrice;
    data['deliveryMethod'] = this.deliveryMethod;
    data['paymentMethod'] = this.paymentMethod;
    return data;
  }
}
