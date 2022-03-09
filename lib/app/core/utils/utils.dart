import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_ui_test_nguyenhai/app/core/utils/network_icons.dart';

import 'colors.dart';

enum InformationDisplayCardTypes { humidity, predictability }

extension InformationDisplayCardTypesExtension on InformationDisplayCardTypes {
  Color get getColor {
    switch (this) {
      case InformationDisplayCardTypes.humidity:
        return pictonBlueColor;
      case InformationDisplayCardTypes.predictability:
        return indigoColor;
    }
  }
}

enum DateTimeFormatTypes {
  ymd, // year-mont-day
}

extension DateTimeFormatTypesExtension on DateTimeFormatTypes {
  String get toStringFormat {
    switch (this) {
      case DateTimeFormatTypes.ymd:
        return 'yyyy/MM/dd';
      default:
        return '';
    }
  }
}

enum WeatherStatesTypes {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
}

extension WeatherStatesTypesExtension on WeatherStatesTypes {
  WeatherStatesTypes getTypeByString(String weatherStatesTypes) {
    switch (weatherStatesTypes) {
      case 'Snow':
        return WeatherStatesTypes.snow;
      case 'Sleet':
        return WeatherStatesTypes.sleet;
      case 'Hail':
        return WeatherStatesTypes.hail;
      case 'Thunderstorm':
        return WeatherStatesTypes.thunderstorm;
      case 'Heavy Rain':
        return WeatherStatesTypes.heavyRain;
      case 'Light Rain':
        return WeatherStatesTypes.lightRain;
      case 'Showers':
        return WeatherStatesTypes.showers;
      case 'Heavy Cloud':
        return WeatherStatesTypes.heavyCloud;
      case 'Light Cloud':
        return WeatherStatesTypes.lightCloud;
      case 'Clear':
        return WeatherStatesTypes.clear;
      default:
        return WeatherStatesTypes.values.first; // clear
    }
  }

  Image get getImageWeatherStates {
    switch (this) {
      case WeatherStatesTypes.snow:
        return Image.network(iconSnow);
      case WeatherStatesTypes.sleet:
        return Image.network(iconSleet);
      case WeatherStatesTypes.hail:
        return Image.network(iconHail);
      case WeatherStatesTypes.thunderstorm:
        return Image.network(iconThunderstorm);
      case WeatherStatesTypes.heavyRain:
        return Image.network(iconHeavyRain);
      case WeatherStatesTypes.lightRain:
        return Image.network(iconLightRain);
      case WeatherStatesTypes.showers:
        return Image.network(iconShowers);
      case WeatherStatesTypes.heavyCloud:
        return Image.network(iconHeavyCloud);
      case WeatherStatesTypes.lightCloud:
        return Image.network(iconLightCloud);
      default:
        return Image.network(iconClear); // clear
    }
  }
}

List<DateTime> getAllDayInWeek(DateTime dateTime) {
  var startDate = dateTime.subtract(Duration(days: dateTime.weekday));
  var listDate = List.generate(7, (i) => startDate.add(Duration(days: i)));
  return listDate;
}

DateTime getDateNextWeek(DateTime dateTime) {
  return dateTime.add(const Duration(days: 7));
}

DateTime getDateLastWeek(DateTime dateTime) {
  return dateTime.add(const Duration(days: -7));
}
