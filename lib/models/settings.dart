class Settings {
  bool seniorModeOn;

  /// All properties should be initialized in constructor because SettingsService
  /// creates default Settings model if there are no data in SharedPreferences.
  Settings({this.seniorModeOn = false});

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      seniorModeOn: json['seniorModeOn'],
    );
  }

  Map<String, dynamic> toJson() => {
        'seniorModeOn': seniorModeOn,
      };
}
