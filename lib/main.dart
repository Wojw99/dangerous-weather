import 'package:dangerous_weather_app/services/location_service.dart';
import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:dangerous_weather_app/utils/strings.dart';
import 'package:dangerous_weather_app/viewmodels/current_weather_vm.dart';
import 'package:dangerous_weather_app/views/screens/current_weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

CurrentWeatherViewModel _viewModel = CurrentWeatherViewModel();

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to fetch data from API
  void fetchApiData() async {
    final locationService = LocationService();
    var lat = 0.0;
    var lon = 0.0;

    try {
      // Wait for loading data
      final position = await locationService.determinePosition();
      lat = position.latitude;
      lon = position.longitude;
      // Wait for loading current weather
      print("await for geo");
      await _viewModel.loadCurrentByGeo(lat: lat, lon: lon);
      print("await for settings");
      await _viewModel.loadSettings();
      print("initialized = true");
      setState(() => _initialized = true);
    } catch (e) {
      // Set `_error` state to true if fetching data was failure
      setState(() => _error = true);
    }
  }

  @override
  void initState() {
    fetchApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if fetching failed
    if (_error) {
      return LoadingAppWidget();
    }

    // Show a loader until data is fetching
    if (!_initialized) {
      return LoadingAppWidget();
    }

    return MaterialAppWidget();
  }
}

class LoadingAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorPrimaryDark,
      child: SpinKitRotatingCircle(
        size: 50.0,
        color: kColorTextIcons,
      ),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: sTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lato',
      ),
      home: ChangeNotifierProvider(
        create: (context) => _viewModel,
        child: CurrentWeatherScreen(),
      ),
    );
  }
}
