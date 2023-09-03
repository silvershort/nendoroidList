import 'package:intl/intl.dart';

extension NullableIntExtension on int? {
  // 천만위 콤마를 생성
  String get comma {
    NumberFormat numberFormat = NumberFormat('###,##0');
    if (this == null) {
      return '-';
    } else {
      return numberFormat.format(this);
    }
  }
}