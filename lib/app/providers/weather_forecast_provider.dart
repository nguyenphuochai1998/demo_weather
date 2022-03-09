import 'dart:convert';

import 'package:get/get.dart';
import '../network/base_api.dart';
import '../provider_entities/weather_forecast_reponse.dart';

class WeatherForecastProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
  }

  Future<Response<List<ConsolidatedWeather>>> getWeatherDataByDate(
      DateTime dateTime) async {
    return httpClient.get(
      '$baseUrl${location(time: dateTime, idLocation: '1252431')}',
      decoder: (json) => List<ConsolidatedWeather>.from(
        json.map((x) => ConsolidatedWeather.fromJson(x)),
      ),
    );
  }
}
