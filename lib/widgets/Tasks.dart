import 'package:animazing/widgets/Task.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  TaskList({Key key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          greatings(),
          image(),
          taskList(),
        ],
      ),
    );
  }
}
