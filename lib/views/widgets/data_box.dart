import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:dangerous_weather_app/viewmodels/current_weather_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DataBox extends StatelessWidget {
  final String label;
  final String value;
  final String imageSrc;

  DataBox({this.label, this.value, this.imageSrc});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CurrentWeatherViewModel>(context);

    return Container(
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage(imageSrc),
            height: viewModel.forMode(normal: 28.0, senior: 30.0),
            width: viewModel.forMode(normal: 28.0, senior: 30.0),
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                  fontSize: viewModel.forMode(normal: 13.0, senior: 16.0),
                  color: viewModel.forMode(
                    normal: kColorTextIconsLess,
                    senior: kColorTextIcons,
                  ),
                ),
              ),
              SizedBox(height: 1.0),
              Text(
                value,
                style: TextStyle(
                  fontSize: !viewModel.seniorModeOn ? 16.0 : 19.0,
                  color: kColorTextIcons,
                  fontWeight: viewModel.forMode(
                    normal: FontWeight.normal,
                    senior: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
