import 'package:intl/intl.dart';

String formateDateTimeString(String date) {
  DateTime dateTime =
      DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parseUtc(date);
  String formattedDate = DateFormat("dd/MM/yyyy").format(dateTime);
  String formattedTime = DateFormat("hh:mm a").format(dateTime);

  return "$formattedDate\n$formattedTime";
}
