// Import the test package and Counter class

import 'package:dangerous_weather_app/viewmodels/current_weather_vm.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_constants.dart';

void main() {
  group('CurrentWeatherViewModel', () {
    /// GLIWICE coords
    test('fetching data from API for Gliwice coords', () async {
      var viewModel = CurrentWeatherViewModel();
      await viewModel.loadCurrentByGeo(lat: kGliwiceLat, lon: kGliwiceLon);
      expect(viewModel.currentWeather.timezone, 'Europe/Warsaw');
      expect(viewModel.city, kGliwiceName);
    });

    /// GLIWICE name
    test('fetching data from API for Gliwice name', () async {
      var viewModel = CurrentWeatherViewModel();
      await viewModel.loadCurrentByCity(kGliwiceName);
      expect(viewModel.currentWeather.timezone, 'Europe/Warsaw');
      expect(viewModel.city, kGliwiceName);
    });

    /// BERLIN name
    test('fetching data from API for Berlin name', () async {
      var viewModel = CurrentWeatherViewModel();
      await viewModel.loadCurrentByCity('Berlin');
      expect(viewModel.currentWeather.timezone, 'Europe/Berlin');
      expect(viewModel.city, 'Berlin');
    });

    /// \tBERLIN\n\n name
    test('fetching data from API for Berlin name', () async {
      var viewModel = CurrentWeatherViewModel();
      await viewModel.loadCurrentByCity('\tBERLIN\n\n');
      expect(viewModel.currentWeather.timezone, 'Europe/Berlin');
      expect(viewModel.city, 'Berlin');
    });
  });
}
