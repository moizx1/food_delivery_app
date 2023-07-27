class FoodModel {
  String? foodId;
  String? imageUrl;
  String? foodName;
  int? price;
  int? quantity;

  FoodModel({
    this.foodId,
    this.imageUrl,
    this.foodName,
    this.price,
    this.quantity,
  });

  FoodModel.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    imageUrl = json['imageUrl'];
    foodName = json['foodName'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    data['imageUrl'] = this.imageUrl;
    data['foodName'] = this.foodName;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}
