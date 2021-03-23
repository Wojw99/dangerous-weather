import 'dart:convert';

import 'package:dangerous_weather_app/models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  SettingsService({this.dataLoaded});

  Settings settings = Settings(seniorModeOn: false);
  final Function dataLoaded;
  String _jsonName = 'dangerous_weather_settings_json';

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(settings);
    prefs.setString(_jsonName, json);
  }

  Future readData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_jsonName)) {
      var json = prefs.getString(_jsonName);
      Map settingsMap = jsonDecode(json);
      settings = Settings.fromJson(settingsMap);
      dataLoaded();
    } else {}
  }
}
