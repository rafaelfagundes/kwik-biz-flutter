import 'package:flutter/foundation.dart';
import 'package:kwik_biz_flutter/modules/user/user_model.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';

class Order {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String friendlyId;
  Map<String, dynamic> userDataOnOrder;
  OrderStatusType status;
  PaymentType paymentType;
  DeliveryType deliveryType;
  List<Map<String, dynamic>> items;
  String orderShortDescription;
  double deliveryFee;
  double itemsValue;
  double finalPrice;
  double discountAmount;
  String coupon;
  String postScriptum;
  DateTime confirmationDate;
  DateTime orderDoneDate;
  DateTime deliveredDate;
  DateTime cancelationDate;
  User user;

  Order({
    @required this.id,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.friendlyId,
    @required this.userDataOnOrder,
    @required this.status,
    @required this.paymentType,
    @required this.deliveryType,
    @required this.items,
    @required this.orderShortDescription,
    @required this.deliveryFee,
    @required this.itemsValue,
    @required this.finalPrice,
    this.discountAmount,
    this.coupon,
    this.postScriptum,
    this.confirmationDate,
    this.orderDoneDate,
    this.deliveredDate,
    this.cancelationDate,
    @required this.user,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    friendlyId = json['friendlyId'];
    userDataOnOrder =
        json['userDataOnOrder'] != null ? json['userDataOnOrder'] : null;
    status = json['status'];
    paymentType = json['paymentType'];
    deliveryType = json['deliveryType'];
    if (json['items'] != null) {
      items = new List<Map<String, dynamic>>();
      json['items'].forEach((v) {
        items.add(v);
      });
    }
    orderShortDescription = json['orderShortDescription'];
    deliveryFee = json['deliveryFee'];
    itemsValue = json['itemsValue'];
    finalPrice = json['finalPrice'];
    discountAmount = json['discountAmount'];
    coupon = json['coupon'];
    postScriptum = json['postScriptum'];
    confirmationDate = json['confirmationDate'];
    orderDoneDate = json['orderDoneDate'];
    deliveredDate = json['deliveredDate'];
    cancelationDate = json['cancelationDate'];
    user = json['userId'] != null ? new User.fromJson(json['userId']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['friendlyId'] = this.friendlyId;
    if (this.userDataOnOrder != null) {
      data['userDataOnOrder'] = this.userDataOnOrder;
    }
    data['status'] = this.status;
    data['paymentType'] = this.paymentType;
    data['deliveryType'] = this.deliveryType;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v).toList();
    }
    data['orderShortDescription'] = this.orderShortDescription;
    data['deliveryFee'] = this.deliveryFee;
    data['itemsValue'] = this.itemsValue;
    data['finalPrice'] = this.finalPrice;
    data['discountAmount'] = this.discountAmount;
    data['coupon'] = this.coupon;
    data['postScriptum'] = this.postScriptum;
    data['confirmationDate'] = this.confirmationDate;
    data['orderDoneDate'] = this.orderDoneDate;
    data['deliveredDate'] = this.deliveredDate;
    data['cancelationDate'] = this.cancelationDate;
    if (this.user != null) {
      data['userId'] = this.user.toJson();
    }
    return data;
  }
}
