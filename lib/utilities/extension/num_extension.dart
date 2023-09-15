import 'package:intl/intl.dart';

extension IntExtension on int {
  int roundTo100() {
    // 100의 배수로 내림하는 로직
    if (this % 100 == 0) {
      // 이미 100의 배수인 경우 그대로 반환
      return this;
    } else {
      // 가장 가까운 100의 배수로 내림
      return (this ~/ 100) * 100;
    }
  }

  String rangeName() {
    return '$this ~ ${this + 100 - 1}';
  }
}

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