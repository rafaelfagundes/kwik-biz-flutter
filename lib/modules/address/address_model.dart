import 'package:kwik_biz_flutter/modules/user/user_model.dart';

class Address {
  String neighbourhood;
  String zipCode;
  String complement;
  String city;
  String street;
  int houseNumber;
  String state;
  String latitude;
  String longitude;
  String title;
  User user;
  bool isDefault;

  Address({
    this.neighbourhood,
    this.zipCode,
    this.complement,
    this.city,
    this.street,
    this.houseNumber,
    this.state,
    this.latitude,
    this.longitude,
    this.title,
    this.user,
    this.isDefault,
  });

  Address.fromJson(Map<String, dynamic> json) {
    neighbourhood = json['neighbourhood'];
    zipCode = json['zipCode'];
    complement = json['complement'];
    city = json['city'];
    street = json['street'];
    houseNumber = json['houseNumber'];
    state = json['state'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    title = json['title'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['neighbourhood'] = this.neighbourhood;
    data['zipCode'] = this.zipCode;
    data['complement'] = this.complement;
    data['city'] = this.city;
    data['street'] = this.street;
    data['houseNumber'] = this.houseNumber;
    data['state'] = this.state;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['title'] = this.title;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['isDefault'] = this.isDefault;
    return data;
  }
}
