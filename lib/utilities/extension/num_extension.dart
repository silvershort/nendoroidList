import 'package:intl/intl.dart';

extension IntExtension on int {
  // 천만위 콤마를 생성
  String get comma {
    NumberFormat numberFormat = NumberFormat('###,##0');
    return numberFormat.format(this);
  }
}