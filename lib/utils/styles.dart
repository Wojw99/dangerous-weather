import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Hint text here',
  hintStyle: TextStyle(color: kColorTextIcons),
  fillColor: kColorPrimaryDark,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: kColorPrimaryDark, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorPrimaryDark, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorPrimaryDark, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorTextIcons, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kClickableBoxShadow = BoxShadow(
  color: Color(0x26212121),
  offset: Offset(0.0, 3.0),
  blurRadius: 6.0,
);
