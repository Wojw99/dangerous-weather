import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityButton extends StatelessWidget {
  CityButton({this.text, this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: kColorPrimaryDark,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 20.0, color: kColorTextIcons),
        ),
      ),
    );
  }
}
