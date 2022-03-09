import 'package:get/get.dart';
import 'package:weather_ui_test_nguyenhai/app/providers/weather_forecast_provider.dart';

import '../controllers/weather_forecast_controller.dart';

class WeatherForecastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherForecastController>(
      () => WeatherForecastController(),
    );

    // Binding Provider
    Get.lazyPut<WeatherForecastProvider>(
      () => WeatherForecastProvider(),
    );
  }
}
