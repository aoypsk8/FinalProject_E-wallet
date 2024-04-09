import 'package:intl/intl.dart';

String formatTimestamp(String timestamp) {
  int timestampInt = int.parse(timestamp);

  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestampInt);
  DateFormat formatter = DateFormat('dd MMM yyyy HH:mm');
  return formatter.format(dateTime);
}
