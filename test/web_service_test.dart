// Import the test package and Counter class

import 'package:dangerous_weather_app/models/current.dart';
import 'package:dangerous_weather_app/models/current_weather.dart';
import 'package:dangerous_weather_app/models/weather.dart';
import 'package:dangerous_weather_app/services/web_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_constants.dart';

void main() {
  group('WebService', () {
    test('parsing CurrentWeather model', () async {
      var webService = WebService();
      var currentW = await webService.getCurrentByGeo(lat: 15.0, lon: 12.0);
      expect(currentW.runtimeType, CurrentWeather);
    });

    test('parsing Current model', () async {
      var webService = WebService();
      var currentW = await webService.getCurrentByGeo(lat: 15.0, lon: 12.0);
      expect(currentW.current.runtimeType, Current);
    });

    test('checking data for the city of Gliwice ', () async {
      var webService = WebService();
      var currentW =
          await webService.getCurrentByGeo(lat: kGliwiceLat, lon: kGliwiceLon);
      expect(currentW.timezone, 'Europe/Warsaw');
    });

    test('getting latitude, longitude for the city of Gliwice ', () async {
      var webService = WebService();
      var coords = await webService.getGeoByCity(city: kGliwiceName);
      expect('${coords.lat} ${coords.lon}', '$kGliwiceLat $kGliwiceLon');
    });

    test('getting city for latitude, longitude', () async {
      var webService = WebService();
      var city =
          await webService.getCityByGeo(lat: kGliwiceLat, lon: kGliwiceLon);
      expect(city, kGliwiceName);
    });

    test('getting air quality for the city of Gliwice ', () async {
      var webService = WebService();
      var airQuality = await webService.getAirQualityByGeo(
          lat: kGliwiceLat, lon: kGliwiceLon);
      expect(airQuality.indexAQ.runtimeType, double);
    });

    test('getting air quality for the 0, 0 ', () async {
      var webService = WebService();
      var airQuality = await webService.getAirQualityByGeo(lat: 0.0, lon: 0.0);
      expect(airQuality.indexAQ.runtimeType, double);
    });
  });
}
