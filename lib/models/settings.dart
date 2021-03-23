class Settings {
  bool seniorModeOn;

  Settings({this.seniorModeOn});

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      seniorModeOn: json['seniorModeOn'],
    );
  }

  Map<String, dynamic> toJson() => {
        'seniorModeOn': seniorModeOn,
      };
}
