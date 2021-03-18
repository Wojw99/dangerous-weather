class AirQuality {
  final double indexAQ;
  final double co;
  final double no;
  final double no2;
  final double o3;
  final double so2;
  final double pm2_5;
  final double pm10;
  final double nh3;

  AirQuality({
    this.indexAQ,
    this.co,
    this.no,
    this.no2,
    this.o3,
    this.so2,
    this.pm2_5,
    this.pm10,
    this.nh3,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return AirQuality(
      indexAQ: json['list'][0]['main']['aqi'].toDouble(),
      co: json['list'][0]['components']['co'].toDouble(),
      no: json['list'][0]['components']['no'].toDouble(),
      no2: json['list'][0]['components']['no2'].toDouble(),
      pm2_5: json['list'][0]['components']['pm2_5'].toDouble(),
      pm10: json['list'][0]['components']['pm10'].toDouble(),
      nh3: json['list'][0]['components']['nh3'].toDouble(),
    );
  }
}
