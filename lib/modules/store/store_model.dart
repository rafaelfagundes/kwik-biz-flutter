import 'package:kwik_biz_flutter/modules/address/address_model.dart';
import 'package:kwik_biz_flutter/modules/city/city_model.dart';
import 'package:kwik_biz_flutter/modules/image/image_model.dart';
import 'package:kwik_biz_flutter/modules/settings/settings_model.dart';

class Store {
  bool isEnabled;
  Settings settings;
  bool isAcceptingPickUp;
  int likes;
  String storeName;
  String predominantColor;
  String backgroundColor;
  DateTime createdAt;
  int numberOfRatings;
  DateTime updatedAt;
  String id;
  bool isDelivering;
  Image logo;
  String email;
  City city;
  bool isOpen;
  Address address;
  Image banner;
  bool isBlocked;
  String phoneNumber;
  double rating;
  String description;

  Store(
      {this.isEnabled,
      this.settings,
      this.isAcceptingPickUp,
      this.likes,
      this.storeName,
      this.predominantColor,
      this.backgroundColor,
      this.createdAt,
      this.numberOfRatings,
      this.updatedAt,
      this.id,
      this.isDelivering,
      this.logo,
      this.email,
      this.city,
      this.isOpen,
      this.address,
      this.banner,
      this.isBlocked,
      this.phoneNumber,
      this.rating,
      this.description});

  Store.fromJson(Map<String, dynamic> json) {
    isEnabled = json['isEnabled'];
    settings = json['settingsId'];
    isAcceptingPickUp = json['isAcceptingPickUp'];
    likes = json['likes'];
    storeName = json['storeName'];
    predominantColor = json['predominantColor'];
    backgroundColor = json['backgroundColor'];
    createdAt = json['createdAt'];
    numberOfRatings = json['numberOfRatings'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    isDelivering = json['isDelivering'];
    logo = json['logoId'];
    email = json['email'];
    city = json['cityId'];
    isOpen = json['isOpen'];
    address = json['addressId'];
    banner = json['bannerId'];
    isBlocked = json['isBlocked'];
    phoneNumber = json['phoneNumber'];
    rating = json['rating'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isEnabled'] = this.isEnabled;
    data['settingsId'] = this.settings;
    data['isAcceptingPickUp'] = this.isAcceptingPickUp;
    data['likes'] = this.likes;
    data['storeName'] = this.storeName;
    data['predominantColor'] = this.predominantColor;
    data['backgroundColor'] = this.backgroundColor;
    data['createdAt'] = this.createdAt;
    data['numberOfRatings'] = this.numberOfRatings;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    data['isDelivering'] = this.isDelivering;
    data['logoId'] = this.logo;
    data['email'] = this.email;
    data['cityId'] = this.city;
    data['isOpen'] = this.isOpen;
    data['addressId'] = this.address;
    data['bannerId'] = this.banner;
    data['isBlocked'] = this.isBlocked;
    data['phoneNumber'] = this.phoneNumber;
    data['rating'] = this.rating;
    data['description'] = this.description;
    return data;
  }
}
