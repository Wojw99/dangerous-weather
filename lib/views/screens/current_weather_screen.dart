import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:dangerous_weather_app/utils/strings.dart';
import 'package:dangerous_weather_app/utils/styles.dart';
import 'package:dangerous_weather_app/viewmodels/current_weather_vm.dart';
import 'package:dangerous_weather_app/views/helpers/color_treshold.dart';
import 'package:dangerous_weather_app/views/helpers/icon_handler.dart';
import 'package:dangerous_weather_app/views/helpers/index.dart';
import 'package:dangerous_weather_app/views/screens/index_screen.dart';
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

  /// Shows dialog, waits for user input and loads new data from API
  /// after input.
  void showInputDialog(BuildContext context) {
    final viewModel = Provider.of<CurrentWeatherViewModel>(
      context,
      listen: false,
    );
    var inputDialog = InputDialog(
      context: context,
      title: '$sInputCity:',
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

  /// Navigate to IndexScreen.
  /// index - Index model to show
  void navigateToIndexScreen(BuildContext context, Index index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IndexScreen(
          indexDanger: index,
        ),
      ),
    );
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
                                fontWeight: FontWeight.bold,
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
                      /// * * * * * * * * * ROW 1 - HEAT * * * * * * * * *
                      DangerBar(
                        value: viewModel.current.feelsLikeCelsius,
                        valueUnit: sCelsiusSign,
                        label: sHeatIndex,
                        index: kHeatIndex,
                        onPressed: () {
                          navigateToIndexScreen(context, kHeatIndex);
                        },
                      ),
                      SizedBox(height: 30.0),

                      /// * * * * * * * * * ROW 2 - UV * * * * * * * * *
                      DangerBar(
                        value: viewModel.current.uvi,
                        label: sUvIndex,
                        index: kUvIndex,
                        onPressed: () {
                          navigateToIndexScreen(context, kUvIndex);
                        },
                      ),
                      SizedBox(height: 30.0),

                      /// * * * * * * * * * ROW 3 - AIR QUALITY * * * * * * * * *
                      DangerBar(
                        value: viewModel.airQuality.indexAQ,
                        label: sAirIndex,
                        index: kAirQualityIndex,
                        onPressed: () {
                          navigateToIndexScreen(context, kAirQualityIndex);
                        },
                      ),
                      SizedBox(height: 30.0),

                      /// * * * * * * * * * ROW 4 - DANGER * * * * * * * * *
                      DangerBar(
                        value: viewModel.countDangerValue(),
                        label: kDangerIndex.name,
                        index: kDangerIndex,
                        onPressed: () {
                          navigateToIndexScreen(context, kDangerIndex);
                        },
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
