// To convert JSON to Class follow the link:
// https://javiercbk.github.io/json_to_dart/

import 'dart:convert';

import 'package:kwik_biz_flutter/modules/store/store_model.dart';
import 'package:kwik_biz_flutter/modules/user/user_model.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';

class Notification {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isRead;
  NotificationType notificationType;
  String logo;
  String body;
  String title;
  Map<String, String> additionalInfo;
  User user;
  Store store;

  Notification({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isRead,
    this.notificationType,
    this.logo,
    this.body,
    this.title,
    this.additionalInfo,
    this.user,
    this.store,
  });

  Notification.fromJson(Map<String, dynamic> _json) {
    id = _json['id'];
    createdAt = _json['createdAt'];
    updatedAt = _json['updatedAt'];
    isRead = _json['isRead'];
    notificationType = _json['notificationType'];
    logo = _json['logo'];
    body = _json['body'];
    title = _json['title'];
    additionalInfo = _json['additionalInfo'] != null
        ? json.decode(_json['additionalInfo'])
        : null;
    user = _json['user'] != null
        ? User.fromJson(json.decode(_json['user']))
        : null;
    store = _json['store'] != null
        ? Store.fromJson(json.decode(_json['store']))
        : null;
  }
}
