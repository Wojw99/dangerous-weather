import 'package:dangerous_weather_app/models/current.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var current = Current(dt: 1615460243);
  var date = DateTime.fromMillisecondsSinceEpoch(current.dt * 1000);
  print('${date.day}.${date.month}.${date.year}');
}
