import 'package:intl/intl.dart';

extension StringExtension on String {
  String get convertRuliwebDateFormat {
   return DateFormat('yyyy-MM-dd').format(DateTime.parse(this));
  }

  int get removeComma {
    try {
      return int.parse(replaceAll(",", ""));
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