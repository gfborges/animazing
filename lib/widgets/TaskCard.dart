import 'package:animazing/Models/Task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  TaskCard({Key key, this.task});

  @override
  _TaskCardState createState() =>
      _TaskCardState(task: this.task);
}

class _TaskCardState extends State<TaskCard> {
  final Task task;
  final Color _color = Colors.amber[600];

  _TaskCardState({ this.task });

  void _onTap() {
    setState(() {
      task.toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        child: buildCard(),
        height: 100,
        margin: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: _color,
          border: Border.all(color: _color),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  Widget buildCard() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              checkbox(),
              info(),
            ],
          ),
          time(),
        ],
      ),
    );
  }

  Widget checkbox() {
    if (task.isComplete) {
      return Icon(Icons.check_circle);
    }
    return Icon(Icons.radio_button_unchecked);
  }

  Widget info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(task.name),
        Text(task.pet),
      ],
    );
  }

  Widget time() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.watch_later_rounded),
        Text('09:10'),
      ],
    );
  }
}
