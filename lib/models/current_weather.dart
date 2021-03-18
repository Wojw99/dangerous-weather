import 'package:dangerous_weather_app/models/current.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

// Equatable - when objects contains same data they will be equal. Default they
// are equal when references to the same place in memory. Equatable overrides
// equals, hashCodes, etc.
class CurrentWeather extends Equatable {
  final String timezone;
  final double lat;
  final double lon;
  final Current current;

  CurrentWeather({
    this.timezone,
    this.lat,
    this.lon,
    this.current,
  }) : super([lat, lon, current]);

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      timezone: json['timezone'],
      current: Current.fromJson(json['current']),
    );
  }
}
