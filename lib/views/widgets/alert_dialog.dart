import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDialog {
  final BuildContext context;
  final String title;
  final String text;

  MyAlertDialog({
    this.context,
    this.title,
    this.text,
  });

  Future<String> showThisDialog({bool sadFace = true}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(text),
              SizedBox(height: 5.0),
              Visibility(
                visible: sadFace,
                child: Text(
                  ':(',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
