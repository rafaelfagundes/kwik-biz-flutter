import 'package:intl/intl.dart';

class CurrencyUtils {
  static String toBRL(double value) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(value);
  }
}
