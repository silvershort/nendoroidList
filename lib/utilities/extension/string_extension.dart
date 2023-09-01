import 'package:intl/intl.dart';

extension StringExtension on String {
  String get convertRuliwebDateFormat {
   return DateFormat('yyyy-MM-dd').format(DateTime.parse(this));
  }
}