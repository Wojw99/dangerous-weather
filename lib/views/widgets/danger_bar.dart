import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:dangerous_weather_app/views/helpers/color_treshold.dart';
import 'package:flutter/cupertino.dart';

class DangerBar extends StatelessWidget {
  final Color defaultBarColor;
  final String label;
  final double value;
  final double valueMin;
  final double valueMax;
  final String valueUnit;
  final double barMaxWidth;
  final List<ColorThreshold> colorThresholds;

  DangerBar({
    this.value = 0,
    this.valueMin = 0.0,
    this.valueMax = 58.0,
    this.valueUnit = '',
    this.label = '',
    this.defaultBarColor = kColorAccent,
    this.barMaxWidth = 363.0,
    this.colorThresholds = const [],
  });

  Color getCorrectColor() {
    var color = defaultBarColor;

    for (var threshold in colorThresholds) {
      if (value > threshold.value) color = threshold.color;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    double barWidth = value * barMaxWidth / valueMax;

    return Column(
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
                // borderRadius: BorderRadius.only(
                //   topRight: Radius.circular(15.0),
                //   bottomRight: Radius.circular(15.0),
                // ),
              ),
            ),

            /// * * * * * * * * FILLED * * * * * * * *
            Container(
              height: 32.0,
              width: barWidth > valueMin ? barWidth : valueMin,
              decoration: BoxDecoration(
                color: getCorrectColor(),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                // borderRadius: BorderRadius.only(
                //   topRight: Radius.circular(15.0),
                //   bottomRight: Radius.circular(15.0),
                // ),
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
    );
  }
}
