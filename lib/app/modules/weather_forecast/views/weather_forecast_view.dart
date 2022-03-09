import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_ui_test_nguyenhai/app/core/utils/utils.dart';
import 'package:weather_ui_test_nguyenhai/app/core/widgets/information_display_card.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/network_icons.dart';
import '../../../core/widgets/weekly_calendar.dart';
import '../controllers/weather_forecast_controller.dart';

class WeatherForecastView extends GetView<WeatherForecastController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: WeeklyCalendarCard(
                      indexSelected: controller.indexDaySelected.value,
                      listDate: controller.listDateWeek,
                      onChange: (index) {
                        controller.onChangeDate(index);
                      },
                      onSwipe: (check) {
                        print(check);
                        if (check) {
                          controller.moveLastWeek();
                        } else {
                          controller.moveNextWeek();
                        }
                      },
                    ),
                  ),
                  controller.isDataShowing.value
                      ? controller.consolidatedWeather.value?.theTemp != null
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    child: WeatherStatesTypes.values.first
                                        .getTypeByString(controller
                                                .consolidatedWeather
                                                .value
                                                ?.weatherStateName ??
                                            '')
                                        .getImageWeatherStates,
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          '${controller.consolidatedWeather.value?.theTemp?.toInt()}°',
                                      style: const TextStyle(
                                          fontSize: 120,
                                          color: funBlueColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const TextSpan(
                                        text: 'C',
                                        style: TextStyle(
                                            fontSize: 70, color: funBlueColor))
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      '${controller.consolidatedWeather.value?.weatherStateName}',
                                      style: const TextStyle(
                                          fontSize: 55, color: funBlueColor)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                      controller.consolidatedWeather.value!
                                                  .created ==
                                              null
                                          ? '-'
                                          : DateFormat('E LLL d,yyyy').format(
                                              controller.consolidatedWeather
                                                      .value!.created ??
                                                  DateTime.now()),
                                      style: TextStyle(fontSize: 30)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InformationDisplayCard(
                                      cardName: "Humidity",
                                      data: controller.dataShowHumidity.value ??
                                          0,
                                      size: Size(
                                          Get.width * 0.4, Get.width * 0.6),
                                      cardTypes:
                                          InformationDisplayCardTypes.humidity,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    InformationDisplayCard(
                                      cardName: "Predictability",
                                      data: controller
                                              .dataShowPredictability.value ??
                                          0,
                                      size: Size(
                                          Get.width * 0.4, Get.width * 0.6),
                                      cardTypes: InformationDisplayCardTypes
                                          .predictability,
                                    )
                                  ],
                                )
                              ],
                            )
                          : const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text('No Data To Show !!'),
                            )
                      : const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
