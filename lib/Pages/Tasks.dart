import 'package:animazing/Pages/BasePage.dart';
import 'package:animazing/widgets/Task.dart';
import 'package:flutter/material.dart';

class Tasks extends BasePage {
  final DateTime time;

  Tasks({Key key, @required this.time}) : super(key: key);

  String formatTime() {
    return '${this.time.hour}:${this.time.minute}';
  }

  Widget greatings() {
    return Center(
      child: Container(
        child: Text('Welcome, Gefferson'),
        margin: EdgeInsets.only(top: 30),
      ),
    );
  }

  Widget image() {
    return Container(
        child: Image.network(
      'https://i.imgur.com/zc2JfLO.jpg',
      height: 150,
    ));
  }

  Widget taskList() {
    Widget taskOne = Task(
      name: 'Task 1',
      petName: 'Alaska',
    );
    Widget taskTwo = Task(
      name: 'Task 2',
      petName: 'Nico',
    );
    Widget taskThree = Task(
      name: 'Task 3',
      petName: 'Thor',
    );

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          taskOne,
          taskTwo,
          taskThree,
          taskOne,
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            greatings(),
            image(),
            taskList(),
          ],
        ),
      ),
    );
  }
}
