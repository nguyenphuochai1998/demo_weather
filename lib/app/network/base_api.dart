import 'package:weather_ui_test_nguyenhai/app/core/utils/format_data.dart';

const baseUrl = 'https://www.metaweather.com/api';

String location({idLocation, required DateTime time}) =>
    '/location/$idLocation/${dateTimeToString(time: time)}';
