import 'package:animazing/Models/Task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  TaskCard({Key key, this.task});

  @override
  _TaskCardState createState() => _TaskCardState(task: this.task);
}

class _TaskCardState extends State<TaskCard> {
  final Task task;
  final Color _color = Colors.white;

  _TaskCardState({this.task});

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
        height: 70,
        margin: EdgeInsets.only(top: 6, bottom: 6),
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
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: checkbox(),
              ),
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
    return Icon(Icons.radio_button_unchecked, color: Colors.grey);
  }

  Widget info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          task.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(task.pet),
      ],
    );
  }

  Widget time() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.watch_later_outlined),
        Text(task.time),
      ],
    );
  }
}
