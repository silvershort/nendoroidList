
import 'package:intl/intl.dart';

class IntlUtil {
  static String comma(int rawNum) {
    NumberFormat numberFormat = NumberFormat('###,##0');
    return numberFormat.format(rawNum);
  }

  static String convertDate({String? gmtTime}) {
    DateFormat formatter = DateFormat("yyyy-MM-dd HH:mm");
    // 현재 시간을 받아온다.
    DateTime dateTime = DateTime.now();

    // gmtTime 일 경우 9시간을 더해준다.
    if (gmtTime != null) {
      dateTime = DateTime.parse(gmtTime.replaceAll("T", " "))
          .add(const Duration(hours: 9));
    }
    return formatter.format(dateTime);
  }

  static String convertRuliwebDateFormat(String time) {
    DateFormat formatter = DateFormat("yyyy-MM-dd");
    return formatter.format(DateTime.parse(time));
  }

  static bool needUpdate(String serverDate, String localDate) {
    try {
      DateTime dateTime1 = DateTime.parse(serverDate);
      DateTime dateTime2 = DateTime.parse(localDate);

      // 1이다 => 서버날짜가 로컬날짜보다 크다 = 업데이트가 필요하다
      int result = dateTime1.compareTo(dateTime2);
      return result > 0 ? true : false;

      // 잘못된 형식으로 변환에 실패했을때
    } on FormatException catch (_) {
      return false;
    }
  }
}
