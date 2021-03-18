import 'package:dangerous_weather_app/models/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

// Equatable - when objects contains same data they will be equal. Default they
// are equal when references to the same place in memory. Equatable overrides
// equals, hashCodes, etc.
class Current extends Equatable {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;

  /// WARNING! Tha value can be nullable after API calling because wind gust
  /// not always is available
  final double windGust;

  final List<Weather> weather;

  DateTime get currentDate => DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  DateTime get sunriseDate =>
      DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
  DateTime get sunsetDate => DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
  double get tempCelsius => temp - 272.15;
  double get feelsLikeCelsius => feelsLike - 272.15;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather = const [],
  }) : super([
          dt,
          sunrise,
          sunset,
          temp,
          feelsLike,
          pressure,
          humidity,
          dewPoint,
          uvi,
          clouds,
          visibility,
          windSpeed,
          windDeg,
          windGust,
        ]);

  factory Current.fromJson(Map<String, dynamic> json) {
    final weather = json['weather']
        .cast<Map<String, dynamic>>()
        .map<Weather>((json) => Weather.fromJson(json))
        .toList();
    return Current(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'].toDouble(),
      uvi: json['uvi'].toDouble(),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'].toDouble(),
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'] != null ? json['wind_gust'].toDouble() : null,
      weather: weather,
    );
  }
}
