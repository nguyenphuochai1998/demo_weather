import 'package:get/get.dart';
import 'package:weather_ui_test_nguyenhai/app/core/utils/utils.dart';

import '../../../provider_entities/weather_forecast_reponse.dart';
import '../../../providers/weather_forecast_provider.dart';
import 'package:collection/collection.dart';

class WeatherForecastController extends GetxController {
  static final WeatherForecastProvider _weatherForecastProvider =
      WeatherForecastProvider();
  late RxList<DateTime> listDateWeek = <DateTime>[].obs;
  RxInt indexDaySelected = 2.obs;
  RxBool isDataShowing = false.obs;
  Rx<ConsolidatedWeather?> consolidatedWeather = ConsolidatedWeather().obs;
  RxInt dataShowHumidity = 0.obs;
  RxInt dataShowPredictability = 0.obs;

  @override
  void onInit() {
    super.onInit();
    listDateWeek.value = getAllDayInWeek(DateTime.now());
  }

  @override
  void onReady() async {
    super.onReady();
    await onUpdateDataShow();
  }

  Future onChangeDate(int index) async {
    indexDaySelected.value = index;
    await onUpdateDataShow();
  }

  Future onUpdateDataShow() async {
    isDataShowing.value = false;
    var response = await _weatherForecastProvider
        .getWeatherDataByDate(listDateWeek[indexDaySelected.value]);
    List<ConsolidatedWeather>? listData = response.body;
    if (listData!.isNotEmpty) {
      var consolidatedWeatherData = calculateAverage(
          listData: listData,
          dateTimeSelected: listDateWeek[indexDaySelected.value]);
      consolidatedWeather.value =
          consolidatedWeatherData ?? ConsolidatedWeather();
      isDataShowing.value = true;
      animationShowHumidity();
      animationPredictability();
    } else {
      consolidatedWeather.value = ConsolidatedWeather();
      isDataShowing.value = true;
    }
  }

  ConsolidatedWeather? calculateAverage(
      {required List<ConsolidatedWeather> listData,
      required DateTime dateTimeSelected}) {
    List<ConsolidatedWeather> dataCheck = listData
        .where((element) =>
            DateTime(dateTimeSelected.year, dateTimeSelected.month,
                    dateTimeSelected.day)
                .difference(DateTime(element.created!.year,
                    element.created!.month, element.created!.day))
                .inDays ==
            0)
        .toList();
    if (dataCheck.isEmpty) return null;
    Map<String, int> mapName = {};
    String keyMax = '';
    int max = 0;
    dataCheck.map((e) => e.weatherStateName!).forEach((element) {
      if (mapName.containsKey(element)) {
        mapName[element] = mapName[element]! + 1;
      } else {
        mapName[element] = 1;
      }
      if (mapName[element]! > max) {
        max = mapName[element]!;
        keyMax = element;
      }
    });
    return dataCheck.first.copyWith(
        theTemp: dataCheck.map((e) => e.theTemp!).average,
        predictability: dataCheck.map((e) => e.predictability!).average.floor(),
        humidity: dataCheck.map((e) => e.humidity!).average.floor(),
        weatherStateName: keyMax);
  }

  void animationShowHumidity() {
    dataShowHumidity.value = 0;
    Future.forEach(
        List.generate(
            consolidatedWeather.value!.humidity!.toInt(), (index) => index + 1),
        (int element) async {
      await Future.delayed(Duration(
          milliseconds: 1500 ~/ consolidatedWeather.value!.humidity!.toInt()));
      dataShowHumidity.value = element;
    });
  }

  void animationPredictability() {
    dataShowPredictability.value = 0;
    Future.forEach(
        List.generate(consolidatedWeather.value!.predictability!.toInt(),
            (index) => index + 1), (int element) async {
      await Future.delayed(Duration(
          milliseconds:
              1500 ~/ consolidatedWeather.value!.predictability!.toInt()));
      dataShowPredictability.value = element;
    });
  }

  Future moveNextWeek() async {
    listDateWeek.value =
        getAllDayInWeek(getDateNextWeek(listDateWeek[indexDaySelected.value]));
    indexDaySelected.value = 2;
    await onUpdateDataShow();
  }

  Future moveLastWeek() async {
    listDateWeek.value =
        getAllDayInWeek(getDateLastWeek(listDateWeek[indexDaySelected.value]));
    indexDaySelected.value = 2;
    await onUpdateDataShow();
  }

  @override
  void onClose() {}
}
