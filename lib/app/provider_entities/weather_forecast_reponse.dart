import 'dart:convert';

WeatherForecastResponse weatherForecastResponseFromJson(String str) =>
    WeatherForecastResponse.fromJson(json.decode(str));

String weatherForecastResponseToJson(WeatherForecastResponse data) =>
    json.encode(data.toJson());

class WeatherForecastResponse {
  WeatherForecastResponse({
    this.consolidatedWeather,
    this.time,
    this.sunRise,
    this.sunSet,
    this.timezoneName,
    this.parent,
    this.sources,
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
    this.timezone,
  });

  List<ConsolidatedWeather>? consolidatedWeather;
  DateTime? time;
  DateTime? sunRise;
  DateTime? sunSet;
  String? timezoneName;
  Parent? parent;
  List<Source>? sources;
  String? title;
  String? locationType;
  int? woeid;
  String? lattLong;
  String? timezone;

  factory WeatherForecastResponse.fromJson(Map<String, dynamic> json) =>
      WeatherForecastResponse(
        consolidatedWeather: json["consolidated_weather"] == null
            ? null
            : List<ConsolidatedWeather>.from(json["consolidated_weather"]
                .map((x) => ConsolidatedWeather.fromJson(x))),
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        sunRise:
            json["sun_rise"] == null ? null : DateTime.parse(json["sun_rise"]),
        sunSet:
            json["sun_set"] == null ? null : DateTime.parse(json["sun_set"]),
        timezoneName: json["timezone_name"],
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
        sources: json["sources"] == null
            ? null
            : List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "consolidated_weather": consolidatedWeather == null
            ? null
            : List<dynamic>.from(consolidatedWeather!.map((x) => x.toJson())),
        "time": time == null ? null : time!.toIso8601String(),
        "sun_rise": sunRise == null ? null : sunRise!.toIso8601String(),
        "sun_set": sunSet == null ? null : sunSet!.toIso8601String(),
        "timezone_name": timezoneName,
        "parent": parent == null ? null : parent!.toJson(),
        "sources": sources == null
            ? null
            : List<dynamic>.from(sources!.map((x) => x.toJson())),
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
        "timezone": timezone,
      };
}

class ConsolidatedWeather {
  ConsolidatedWeather({
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  int? id;
  String? weatherStateName;
  String? weatherStateAbbr;
  String? windDirectionCompass;
  DateTime? created;
  DateTime? applicableDate;
  double? minTemp;
  double? maxTemp;
  double? theTemp;
  double? windSpeed;
  double? windDirection;
  double? airPressure;
  int? humidity;
  double? visibility;
  int? predictability;

  ConsolidatedWeather copyWith({
    int? id,
    String? weatherStateName,
    String? weatherStateAbbr,
    String? windDirectionCompass,
    DateTime? created,
    DateTime? applicableDate,
    double? minTemp,
    double? maxTemp,
    double? theTemp,
    double? windSpeed,
    double? windDirection,
    double? airPressure,
    int? humidity,
    double? visibility,
    int? predictability,
  }) {
    return ConsolidatedWeather(
      id: id ?? this.id,
      weatherStateName: weatherStateName ?? this.weatherStateName,
      weatherStateAbbr: weatherStateAbbr ?? this.weatherStateAbbr,
      windDirectionCompass: windDirectionCompass ?? this.windDirectionCompass,
      created: created ?? this.created,
      applicableDate: applicableDate ?? this.applicableDate,
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      theTemp: theTemp ?? this.theTemp,
      windSpeed: windSpeed ?? this.windSpeed,
      windDirection: windDirection ?? this.windDirection,
      airPressure: airPressure ?? this.airPressure,
      humidity: humidity ?? this.humidity,
      visibility: visibility ?? this.visibility,
      predictability: predictability ?? this.predictability,
    );
  }

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      ConsolidatedWeather(
        id: json["id"],
        weatherStateName: json["weather_state_name"],
        weatherStateAbbr: json["weather_state_abbr"],
        windDirectionCompass: json["wind_direction_compass"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        applicableDate: json["applicable_date"] == null
            ? null
            : DateTime.parse(json["applicable_date"]),
        minTemp: json["min_temp"] == null ? null : json["min_temp"].toDouble(),
        maxTemp: json["max_temp"] == null ? null : json["max_temp"].toDouble(),
        theTemp: json["the_temp"] == null ? null : json["the_temp"].toDouble(),
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDirection: json["wind_direction"] == null
            ? null
            : json["wind_direction"].toDouble(),
        airPressure: json["air_pressure"],
        humidity: json["humidity"],
        visibility:
            json["visibility"] == null ? null : json["visibility"].toDouble(),
        predictability: json["predictability"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weather_state_name": weatherStateName,
        "weather_state_abbr": weatherStateAbbr,
        "wind_direction_compass": windDirectionCompass,
        "created": created == null ? null : created!.toIso8601String(),
        "applicable_date": applicableDate == null
            ? null
            : "${applicableDate!.year.toString().padLeft(4, '0')}-${applicableDate!.month.toString().padLeft(2, '0')}-${applicableDate!.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
      };
}

class Parent {
  Parent({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  String? title;
  String? locationType;
  int? woeid;
  String? lattLong;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
      };
}

class Source {
  Source({
    this.title,
    this.slug,
    this.url,
    this.crawlRate,
  });

  String? title;
  String? slug;
  String? url;
  int? crawlRate;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        title: json["title"],
        slug: json["slug"],
        url: json["url"],
        crawlRate: json["crawl_rate"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "url": url,
        "crawl_rate": crawlRate,
      };
}
