import 'package:kwik_biz_flutter/modules/address/address_model.dart';
import 'package:kwik_biz_flutter/modules/city/city_model.dart';
import 'package:kwik_biz_flutter/modules/image/image_model.dart';
import 'package:kwik_biz_flutter/modules/store/store_model.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';

class User {
  String id;
  String createdAt;
  String updatedAt;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  DateTime dateOfBirth;
  Gender gender;
  List<Address> adresses;
  Store store;
  Image image;
  City selectedCity;

  User({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    this.adresses,
    this.store,
    this.image,
    this.selectedCity,
  });

  Gender _genderFromJsonToEnum(String genderChar) {
    switch (genderChar) {
      case 'F':
        return Gender.FEMALE;
      case 'M':
        return Gender.MALE;
      case 'O':
        return Gender.OTHER;
      default:
        return Gender.OTHER;
    }
  }

  String _genderFromEnumToJson(Gender gender) {
    switch (gender) {
      case Gender.MALE:
        return 'M';
      case Gender.FEMALE:
        return 'F';
      case Gender.OTHER:
        return 'O';
      default:
        return '0';
    }
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    dateOfBirth = json['dateOfBirth'];
    gender = _genderFromJsonToEnum(json['gender']);
    if (json['adresses'] != null) {
      adresses = new List<Null>();
      json['adresses'].forEach((v) {
        adresses.add(new Address.fromJson(v));
      });
    }
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    selectedCity = json['selectedCity'] != null
        ? new City.fromJson(json['selectedCity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = _genderFromEnumToJson(this.gender);
    if (this.adresses != null) {
      data['adresses'] = this.adresses.map((v) => v.toJson()).toList();
    }
    if (this.store != null) {
      data['store'] = this.store.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.selectedCity != null) {
      data['selectedCity'] = this.selectedCity.toJson();
    }
    return data;
  }
}
