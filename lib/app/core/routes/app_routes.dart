part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const WEATHER_FORECAST = _Paths.WEATHER_FORECAST;
}

abstract class _Paths {
  _Paths._();
  static const WEATHER_FORECAST = '/weather-forecast';
}
