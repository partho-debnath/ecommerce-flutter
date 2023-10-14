class ProfileData {
  int? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? city;
  String? shippingAddress;
  String? email;
  String? createdAt;
  String? updatedAt;

  ProfileData({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.city,
    this.shippingAddress,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobile: json['mobile'],
      city: json['city'],
      shippingAddress: json['shippingAddress'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobile'] = mobile;
    data['city'] = city;
    data['shippingAddress'] = shippingAddress;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
