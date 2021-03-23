import 'package:flutter/cupertino.dart';

import 'danger_bar_interval.dart';

class Index {
  final String name;
  final String description;
  final double maxValue;
  final List<DangerBarInterval> intervals;

  Index({
    this.name = '',
    @required this.maxValue,
    this.description = '',
    @required this.intervals,
  });
}
