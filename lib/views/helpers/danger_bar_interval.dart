import 'dart:ui';

import 'package:dangerous_weather_app/utils/constants.dart';

// A helper class for danger bars defines from what value a given color
// should be displayed
class DangerBarInterval {
  final String label;
  final String text;
  int value;
  Color color;

  DangerBarInterval({
    this.label = '',
    this.text = '',
    this.value = 0,
    this.color = kColorPrimary,
  });
}
