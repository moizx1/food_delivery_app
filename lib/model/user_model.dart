class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? imageUrl;
  List<dynamic>? favouriteFoods;

  UserModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.imageUrl,
      this.favouriteFoods});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    address = json['address'];
    imageUrl = json['imageUrl'];
    favouriteFoods = json['favouriteFood'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['imageUrl'] = this.imageUrl;
    data['favouriteFood'] = this.favouriteFoods;
    return data;
  }
}
