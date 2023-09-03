import 'package:intl/intl.dart';

extension StringExtension on String {
  String get convertRuliwebDateFormat {
   return DateFormat('yyyy-MM-dd').format(DateTime.parse(this));
  }

  int get removeComma {
    try {
      return int.parse(replaceAll(",", ""));
    } catch (error, stackTrace) {
      return 0;
    }
  }
}