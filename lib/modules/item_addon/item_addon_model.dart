import 'package:flutter/foundation.dart';

class ItemAddon {
  int qty;
  String title;
  double value;

  ItemAddon({
    @required this.qty,
    @required this.title,
    @required this.value,
  });

  ItemAddon.fromJson(Map<String, dynamic> json) {
    qty = json['qty'];
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qty'] = this.qty;
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}
