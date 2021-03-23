import 'package:dangerous_weather_app/models/air_quality.dart';
import 'package:dangerous_weather_app/models/current.dart';
import 'package:dangerous_weather_app/models/current_weather.dart';
import 'package:dangerous_weather_app/models/settings.dart';
import 'package:dangerous_weather_app/services/web_service.dart';
import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class CurrentWeatherViewModel extends ChangeNotifier {
  CurrentWeather _currentWeather;
  CurrentWeather get currentWeather => _currentWeather;
  Current get current => _currentWeather.current;

  String _city;
  String get city => _city;

  AirQuality _airQuality;
  AirQuality get airQuality => _airQuality;

  Settings _settings;
  bool get seniorModeOn => _settings.seniorModeOn;

  /// Fetching API data and initializes _currentWeather and _city
  /// Firstly gets current weather by getCurrentByGeo()
  /// then gets city name by getCityByGeo()
  /// then gets air quality by getAirQualityByGeo()
  Future<void> loadCurrentByGeo({double lat, double lon}) async {
    final webService = WebService();
    final weather = await webService.getCurrentByGeo(lat: lat, lon: lon);
    final city = await webService.getCityByGeo(lat: lat, lon: lon);
    final airQuality = await webService.getAirQualityByGeo(lat: lat, lon: lon);

    _currentWeather = weather;
    _city = city;
    _airQuality = airQuality;

    notifyListeners();
  }

  /// Fetching API data and initializes _currentWeather and _city
  /// Firstly gets coords by getGeoByCity()
  /// then gets current weather by getCurrentByGeo()
  /// then gets air quality by getAirQualityByGeo()
  Future<void> loadCurrentByCity(String cityName) async {
    final webService = WebService();

    cityName = cityName.trim().toLowerCase();
    cityName = cityName[0].toUpperCase() + cityName.substring(1);

    final coords = await webService.getGeoByCity(city: cityName);
    // print('${coords.lat}, ${coords.lon}');
    final weather = await webService.getCurrentByGeo(
      lat: coords.lat,
      lon: coords.lon,
    );
    print(weather.current.weather[0].icon);
    final airQuality = await webService.getAirQualityByGeo(
      lat: coords.lat,
      lon: coords.lon,
    );
    // print(airQuality.indexAQ);

    _currentWeather = weather;
    _city = cityName;
    _airQuality = airQuality;

    notifyListeners();
  }

  /// Load settings data from shared preferences
  Future<void> loadSettings() async {
    // TODO: read data from shared preferences
    _settings = Settings(seniorModeOn: false);
  }

  /// Counts value percent of max value for each index. Next, counts sum of them.
  double countDangerValue() {
    var heatPercent = (current.feelsLikeCelsius / kHeatIndex.maxValue) * 100;
    var uvPercent = (current.uvi / kUvIndex.maxValue) * 100;
    var airQualityPercent =
        (airQuality.indexAQ / kAirQualityIndex.maxValue) * 100;
    return heatPercent + uvPercent + airQualityPercent;
  }

  /// Turn on/off senior mode.
  void toggleSeniorMode() {
    _settings.seniorModeOn = !_settings.seniorModeOn;
    // TODO: write data to shared preferences
    notifyListeners();
  }

  dynamic forMode({dynamic normal, dynamic senior}) {
    if (seniorModeOn)
      return senior;
    else
      return normal;
  }
}
