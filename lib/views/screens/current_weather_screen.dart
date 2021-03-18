import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:dangerous_weather_app/utils/strings.dart';
import 'package:dangerous_weather_app/utils/styles.dart';
import 'package:dangerous_weather_app/viewmodels/current_weather_vm.dart';
import 'package:dangerous_weather_app/views/helpers/color_treshold.dart';
import 'package:dangerous_weather_app/views/helpers/icon_handler.dart';
import 'package:dangerous_weather_app/views/widgets/alert_dialog.dart';
import 'package:dangerous_weather_app/views/widgets/city_button.dart';
import 'package:dangerous_weather_app/views/widgets/danger_bar.dart';
import 'package:dangerous_weather_app/views/widgets/data_box.dart';
import 'package:dangerous_weather_app/views/widgets/input_dialog.dart';
import 'package:dangerous_weather_app/views/widgets/main_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CurrentWeatherScreen extends StatelessWidget {
  static const String id = 'current_weather_screen';
  final dateFormat = new DateFormat('dd.MM.yyyy');
  final hourFormat = new DateFormat('hh:mm');
  final iconHandler = IconHandler();

  void showInputDialog(BuildContext context) {
    final viewModel = Provider.of<CurrentWeatherViewModel>(
      context,
      listen: false,
    );
    var inputDialog = InputDialog(
      context: context,
      title: 'Podaj miejscowość:',
    );
    var alertDialog =
        MyAlertDialog(context: context, title: sError, text: sErrorNotFound);

    // shows dialog and waits for user input
    inputDialog.showInputDialog().then((value) {
      viewModel.loadCurrentByCity(value).catchError((error) {
        alertDialog.showThisDialog();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CurrentWeatherViewModel>(context);

    return Scaffold(
      /// * * * * * * * * * APPBAR * * * * * * * * *
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kColorPrimary,
        title: Text(sTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),

      /// * * * * * * * * * BODY * * * * * * * * *
      body: SingleChildScrollView(
        child: Container(
          // color: kColorPrimary,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topLeft,
              tileMode: TileMode.clamp,
              colors: <Color>[kColorPrimaryDark, kColorPrimary],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),

                /// * * * * * * * * * ROW 1 - CITY BUTTON * * * * * * * * *
                CityButton(
                  text:
                      '${viewModel.city}, ${viewModel.currentWeather.timezone.split('/')[0]}',
                  onPressed: () {
                    showInputDialog(context);
                  },
                ),
                SizedBox(
                  height: 35.0,
                ),

                /// * * * * * * * * * ROW 2 - WEATHER BODY * * * * * * * * *
                Container(
                  height: 364.0,
                  decoration: BoxDecoration(
                    color: kColorPrimaryDark,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: <Widget>[
                        /// * * * * * * * * * ROW 2, 1 * * * * * * * * *
                        Expanded(
                          child: MainBox(
                            label: viewModel.current.weather[0].descriptionPl,
                            date: viewModel.current.currentDate,
                            imagePath: iconHandler
                                .getIconPath(viewModel.current.weather[0].icon),
                          ),
                        ),

                        /// * * * * * * * * * ROW 2, 2 * * * * * * * * *
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '${viewModel.current.tempCelsius.toStringAsPrecision(2)}$sCelsiusSign',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 65,
                                color: kColorTextIcons,
                              ),
                            ),
                          ),
                        ),

                        /// * * * * * * * * * ROW 2, 3 * * * * * * * * *
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  DataBox(
                                    imageSrc: 'assets/i_wind.png',
                                    label: sWind,
                                    value: '${viewModel.current.windSpeed}m/s',
                                  ),
                                  DataBox(
                                    imageSrc: 'assets/i_sun.png',
                                    label: sSunrise,
                                    value:
                                        '${hourFormat.format(viewModel.current.sunriseDate)}',
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  DataBox(
                                    imageSrc: 'assets/i_gauge.png',
                                    label: sPressure,
                                    value: '${viewModel.current.pressure}hPa',
                                  ),
                                  DataBox(
                                    imageSrc: 'assets/i_moon.png',
                                    label: sSunset,
                                    value:
                                        '${hourFormat.format(viewModel.current.sunsetDate)}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// * * * * * * * * * ROW 3 - DANGER BARS * * * * * * * * *
                SizedBox(height: 10.0),
                Container(
                  child: Column(
                    children: <Widget>[
                      DangerBar(
                        value: viewModel.current.feelsLikeCelsius,
                        valueMax: kHeatIndexMax,
                        valueUnit: sCelsiusSign,
                        label: sHeatIndex,
                        defaultBarColor: Colors.green,
                        colorThresholds: [
                          ColorThreshold(value: 27, color: Colors.yellow),
                          ColorThreshold(value: 33, color: Colors.orange),
                          ColorThreshold(value: 41, color: Colors.deepOrange),
                          ColorThreshold(value: 54, color: Colors.red),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      DangerBar(
                        value: viewModel.current.uvi,
                        valueMax: kUvIndexMax,
                        label: sUvIndex,
                        defaultBarColor: Colors.green,
                        colorThresholds: [
                          ColorThreshold(value: 0, color: Colors.green),
                          ColorThreshold(value: 3, color: Colors.yellow),
                          ColorThreshold(value: 6, color: Colors.orange),
                          ColorThreshold(value: 8, color: Colors.red),
                          ColorThreshold(value: 11, color: Colors.deepPurple),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      DangerBar(
                        value: viewModel.airQuality.indexAQ,
                        valueMax: kAirIndexMax,
                        label: sAirIndex,
                        defaultBarColor: Colors.green,
                        colorThresholds: [
                          ColorThreshold(value: 0, color: Colors.green),
                          ColorThreshold(value: 4, color: Colors.yellow),
                          ColorThreshold(value: 7, color: Colors.orange),
                          ColorThreshold(value: 10, color: Colors.red),
                        ],
                      ),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}