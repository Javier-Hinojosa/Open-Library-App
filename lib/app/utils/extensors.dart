import 'package:intl/intl.dart';

extension Formats on String {

  int toInt() {
    return int.parse(this);
  }
  double toDouble() {
    return double.parse(this);
  }
  DateTime toDate() {
    return DateTime.parse(this);
  }
}

extension DateFormating on DateTime {
  String formatDate() {
    return DateFormat("yyyy-MM-dd").format(toLocal());
  }

  String formatHour() {
    return DateFormat("hh:mm aa").format(this);
  }

  String formatDateHour() {
    return DateFormat("yyyy-MM-dd hh:mm aa").format(this);
  }

  String formatDateHourNotFormat() {
    return DateFormat("yyyyMMddHHmmss").format(this);
  }

  String formatInSpanish() {
    return DateFormat('dd MMMM yyyy', 'es_ES').format(this);
  }
}