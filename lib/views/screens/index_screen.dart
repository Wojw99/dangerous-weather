import 'package:dangerous_weather_app/utils/constants.dart';
import 'package:dangerous_weather_app/utils/strings.dart';
import 'package:dangerous_weather_app/viewmodels/current_weather_vm.dart';
import 'package:dangerous_weather_app/views/helpers/index.dart';
import 'package:dangerous_weather_app/views/widgets/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatelessWidget {
  final Index indexDanger;
  final bool seniorMode;

  IndexScreen({
    @required this.indexDanger,
    this.seniorMode = false,
  });

  String getIntervalNumbers(int index) {
    final current = indexDanger.intervals[index];
    final length = indexDanger.intervals.length;

    if (index == 0 && length > 1) {
      return '< ${indexDanger.intervals[index + 1].value}';
    } else if (index == indexDanger.intervals.length - 1) {
      return '${current.value}+';
    } else {
      final leftVal = current.value;
      final rightVal = indexDanger.intervals[index + 1].value - 1;

      if (leftVal == rightVal) return leftVal.toString();

      return '$leftVal - $rightVal';
    }
  }

  /// Shows dialog with information about current index
  void showAlertDialog(BuildContext context) {
    var dialog = MyAlertDialog(
      context: context,
      title: indexDanger.name,
      text: indexDanger.description,
    );
    // shows dialog and waits for user pressed
    dialog.showThisDialog(sadFace: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kColorPrimary,
        title: Text(indexDanger.name),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              showAlertDialog(context);
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topLeft,
            tileMode: TileMode.clamp,
            colors: !seniorMode
                ? <Color>[kColorPrimaryDark, kColorPrimary]
                : <Color>[kColorTextIcons, kColorTextIcons],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView.builder(
            itemCount: indexDanger.intervals.length,
            itemBuilder: (BuildContext context, int index) {
              final current = indexDanger.intervals[index];
              return Container(
                decoration: BoxDecoration(
                  color: kColorPrimaryDark,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      /// * * * * * * * * ROW 1 * * * * * * * *
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          /// * * * * * * * * FILLED * * * * * * * *
                          Container(
                            height: 26.0,
                            decoration: BoxDecoration(
                              color: current.color,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)),
                            ),
                          ),

                          /// * * * * * * * * VALUE * * * * * * * *
                          Center(
                            child: Text(
                              getIntervalNumbers(index),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: current.color != Colors.yellow
                                    ? kColorTextIcons
                                    : kColorTextSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 6.0,
                      ),

                      /// * * * * * * * * ROW 2 * * * * * * * *
                      Text(
                        current.label,
                        style: TextStyle(
                          fontSize: !seniorMode ? 18.0 : 20.0,
                          color: kColorTextIcons,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        height: 2.0,
                      ),

                      /// * * * * * * * * ROW 3 * * * * * * * *
                      Visibility(
                        visible: current.text.isNotEmpty,
                        child: Text(
                          current.text,
                          style: TextStyle(
                            color: kColorTextIcons,
                            fontSize: !seniorMode ? 16.0 : 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
