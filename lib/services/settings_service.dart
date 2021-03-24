import 'dart:convert';

import 'package:dangerous_weather_app/models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  SettingsService();

  String _jsonName = 'dangerous_weather_settings_json';

  /// Saves data (Settings model) in shared preferences
  void saveData(Settings settings) async {
    final prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(settings);
    prefs.setString(_jsonName, json);
  }

  /// Reads data from shared preferences and returns Settings model.
  /// If there are no variable with specific key, function returns
  /// Settings model with default values for application.
  Future<Settings> readData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(_jsonName)) {
      var json = prefs.getString(_jsonName);
      var settingsMap = jsonDecode(json);
      var settings = Settings.fromJson(settingsMap);

      return settings;
    } else {
      return Settings(seniorModeOn: false);
    }
  }
}
