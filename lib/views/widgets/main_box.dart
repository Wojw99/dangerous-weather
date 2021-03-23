import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:dangerous_weather_app/viewmodels/current_weather_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MainBox extends StatelessWidget {
  final String label;
  final DateTime date;
  final String imagePath;

  MainBox({this.label = '', @required this.date, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CurrentWeatherViewModel>(context);

    return Column(
      children: <Widget>[
        Image(
          image: AssetImage(imagePath),
          height: 70.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: viewModel.forMode(normal: 18.0, senior: 20.0),
            color: kColorTextIcons,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${date.day}.${date.month}.${date.year}, ${date.hour}:${date.minute}',
          style: TextStyle(
            fontSize: viewModel.forMode(normal: 14.0, senior: 18.0),
            color: viewModel.forMode(
              normal: kColorTextIconsLess,
              senior: kColorTextIcons,
            ),
          ),
        )
      ],
    );
  }
}
