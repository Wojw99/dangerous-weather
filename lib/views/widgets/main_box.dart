import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class MainBox extends StatelessWidget {
  final String label;
  final DateTime date;
  final String imagePath;

  MainBox({this.label = '', @required this.date, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage(imagePath),
          height: 70.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: kColorTextIcons,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${date.day}.${date.month}.${date.year}, ${date.hour}:${date.minute}',
          style: TextStyle(
            fontSize: 14.0,
            color: kColorTextIconsLess,
          ),
        )
      ],
    );
  }
}
