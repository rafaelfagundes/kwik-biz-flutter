import 'package:flutter/foundation.dart';

class ProductOption {
  final String label;
  final double optionPrice;
  final String value;

  const ProductOption({
    @required this.label,
    @required this.value,
    @required this.optionPrice,
  });
}
