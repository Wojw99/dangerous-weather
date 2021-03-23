import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:dangerous_weather_app/utils/styles.dart';
import 'package:dangerous_weather_app/views/helpers/color_treshold.dart';
import 'package:dangerous_weather_app/views/helpers/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DangerBar extends StatelessWidget {
  final Color defaultBarColor;
  final String label;
  final double value;
  final double valueMin;
  final String valueUnit;
  final double barMaxWidth;
  final Index index;
  final Function onPressed;

  DangerBar({
    this.value = 0,
    this.valueMin = 0.0,
    this.valueUnit = '',
    this.label = '',
    this.defaultBarColor = Colors.green,
    this.barMaxWidth = 363.0,
    this.index,
    this.onPressed,
  });

  Color getCorrectColor() {
    var color = defaultBarColor;

    for (var interval in index.intervals) {
      if (value >= interval.value) color = interval.color;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    double barWidth = value * barMaxWidth / index.maxValue;

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          /// * * * * * * * * LABEL * * * * * * * *
          Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              color: kColorTextIcons,
            ),
          ),
          SizedBox(height: 7.0),

          /// * * * * * * * * BAR * * * * * * * *
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              /// * * * * * * * * EMPTY * * * * * * * *
              Container(
                height: 32.0,
                decoration: BoxDecoration(
                  color: kColorPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: [kClickableBoxShadow],
                ),
              ),

              /// * * * * * * * * FILLED * * * * * * * *
              Container(
                height: 32.0,
                width: barWidth > valueMin ? barWidth : valueMin,
                decoration: BoxDecoration(
                  color: getCorrectColor(),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),

              /// * * * * * * * * VALUE * * * * * * * *
              Center(
                child: Text(
                  '${value.toStringAsFixed(1)}$valueUnit',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: kColorTextIcons,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
