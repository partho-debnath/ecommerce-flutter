class User {
  String? msg;
  UserModel? data;
  User({this.msg, this.data});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      msg: json['msg'],
      data: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? city;
  String? shippingAddress;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserModel(
      {this.email,
      this.firstName,
      this.lastName,
      this.mobile,
      this.city,
      this.shippingAddress,
      this.updatedAt,
      this.createdAt,
      this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobile: json['mobile'],
      city: json['city'],
      shippingAddress: json['shippingAddress'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobile'] = mobile;
    data['city'] = city;
    data['shippingAddress'] = shippingAddress;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
