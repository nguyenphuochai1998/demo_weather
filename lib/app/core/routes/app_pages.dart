import 'package:get/get.dart';

import '../../modules/weather_forecast/bindings/weather_forecast_binding.dart';
import '../../modules/weather_forecast/views/weather_forecast_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WEATHER_FORECAST;

  static final routes = [
    GetPage(
      name: _Paths.WEATHER_FORECAST,
      page: () => WeatherForecastView(),
      binding: WeatherForecastBinding(),
    ),
  ];
}
