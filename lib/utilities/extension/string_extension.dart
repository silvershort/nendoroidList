import 'package:intl/intl.dart';

extension StringExtension on String {
  String get convertRuliwebDateFormat {
   return DateFormat('yyyy-MM-dd').format(DateTime.parse(this));
  }

  /*String get numberBracket {
    RegExp regExp = RegExp(r'\d+');
    Match? match = regExp.firstMatch(this);

    if (match?.group(0) != null) {
      String number = match!.group(0)!;
      return replaceFirst(number, '[$number]');
    }
    return this;
  }*/

  int get removeComma {
    try {
      return int.parse(replaceAll(",", ""));
    } catch (_) {
      return 0;
    }
  }

  int get onlyNumber {
    try {
      return int.parse(replaceAll(RegExp(r'[^0-9]'), ''));
    } catch (_) {
      return 0;
    }
  }

  int get onlyNumberFirst {
    try {
      RegExp regExp = RegExp(r'\d+');
      Match? match = regExp.firstMatch(this);

      if (match?.group(0) != null) {
        int number = match!.group(0).toIntOrDefault;
        return number;
      }
      return 0;
    } catch (_) {
      return 0;
    }
  }
}

extension NullableStringExtension on String? {
  int get toIntOrDefault {
    try {
      return int.parse(this!);
    } catch (_) {
      return 0;
    }
  }

  double get toDoubleOrDefault {
    try {
      return double.parse(this!);
    } catch (_) {
      return 0.0;
    }
  }
}