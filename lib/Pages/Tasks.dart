

import 'package:animazing/Pages/BasePage.dart';
import 'package:flutter/cupertino.dart';

class Tasks extends BasePage {
  final DateTime time;

  Tasks({Key key, @required this.time}) : super(key: key);

  String formatTime() {
    return '${this.time.hour}:${this.time.minute}';
  }

  Widget getBody() {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TASKS ' + formatTime()),
            ],
          ),
        );
  }

}
