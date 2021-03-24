import 'dart:convert';

import 'package:dangerous_weather_app/models/air_quality.dart';
import 'package:dangerous_weather_app/models/current_weather.dart';
import 'package:dangerous_weather_app/models/geo_coords.dart';
import 'package:dangerous_weather_app/utils/api_key.dart';
import 'package:http/http.dart' as http;

class WebService {
  /// Fetch data from API and returns AirQuality model
  /// for given latitude and longitude.
  Future<AirQuality> getAirQualityByGeo({double lat, double lon}) async {
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/air_pollution', {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': kApiKey,
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return AirQuality.fromJson(json);
    } else {
      throw Exception('Unable to perform request!');
    }
  }

  /// Fetching data from API and returns CurrentWeather model
  /// for given latitude and longitude.
  Future<CurrentWeather> getCurrentByGeo({
    double lat,
    double lon,
  }) async {
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/onecall', {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'exclude': 'minutely,daily,hourly',
      'appid': kApiKey,
    });

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      // print(response.body);
      return CurrentWeather.fromJson(json);
    } else {
      throw Exception('Unable to perform request!');
    }
  }

  /// Fetching data from API and returns GeoCoords model with
  /// latitude and longitude for the given city.
  Future<GeoCoords> getGeoByCity({String city}) async {
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': city,
      'appid': kApiKey,
    });

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return GeoCoords.fromJson(json);
    } else {
      throw Exception('Unable to perform request!');
    }
  }

  /// Fetching data from API and returns nearest city for given latitude and
  /// longitude.
  Future<String> getCityByGeo({double lat, double lon}) async {
    final uri = Uri.https('api.openweathermap.org', '/geo/1.0/reverse', {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'limit': '1',
      'appid': kApiKey,
    });

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final first = json[0];
      return first['name'];
    } else {
      throw Exception('Unable to perform request!');
    }
  }
}
