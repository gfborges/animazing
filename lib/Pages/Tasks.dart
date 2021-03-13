import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  final DateTime time;

  Tasks({Key key, @required this.time}) : super(key: key);

  String formatTime() {
    return '${this.time.hour}:${this.time.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animazing'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TASKS ' + formatTime()),
            ],
          ),
        ),
        bottomNavigationBar: ,
      ),
    );
  }
}
