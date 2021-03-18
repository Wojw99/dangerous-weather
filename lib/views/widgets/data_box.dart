import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class DataBox extends StatelessWidget {
  final String label;
  final String value;
  final String imageSrc;

  DataBox({this.label, this.value, this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.0,
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage(imageSrc),
            height: 28.0,
            width: 28.0,
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                  fontSize: 13.0,
                  color: kColorTextIconsLess,
                ),
              ),
              SizedBox(height: 1.0),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16.0,
                  color: kColorTextIcons,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
