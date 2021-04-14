import 'package:intl/intl.dart';

final currencyFormat = NumberFormat.currency(
  decimalDigits: 2,
  locale: 'pt_Br',
  symbol: "R\$"
);