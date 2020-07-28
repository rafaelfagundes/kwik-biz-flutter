import 'package:flutter/foundation.dart';
import 'package:kwik_biz_flutter/modules/item_addon/item_addon_model.dart';

class CartItem {
  int qty;
  String title;
  double value;
  List<ItemAddon> addons;

  CartItem(
      {@required this.qty,
      @required this.title,
      @required this.value,
      this.addons});

  CartItem.fromJson(Map<String, dynamic> json) {
    qty = json['qty'];
    title = json['title'];
    value = json['value'];
    if (json['addons'] != null) {
      addons = new List<ItemAddon>();
      json['addons'].forEach((v) {
        addons.add(new ItemAddon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qty'] = this.qty;
    data['title'] = this.title;
    data['value'] = this.value;
    if (this.addons != null) {
      data['addons'] = this.addons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
