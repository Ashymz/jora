import 'package:intl/intl.dart';

formatMoney(dynamic money) {
  final numericMoney = double.parse(money.toString());
  return '₦' + NumberFormat(' #,##0').format(numericMoney);
}