import 'package:intl/intl.dart';
import 'utils.dart';

String dateTimeToString(
    {required DateTime time,
    DateTimeFormatTypes format = DateTimeFormatTypes.ymd}) {
  return DateFormat(format.toStringFormat).format(time);
}
