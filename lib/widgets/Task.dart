import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String name;
  final String petName;

  Task({Key key, this.name, this.petName});

  @override
  _TaskState createState() =>
      _TaskState(name: this.name, petName: this.petName);
}

class _TaskState extends State<Task> {
  final String name;
  final String petName;
  bool isComplete = false;

  final Color _color = Colors.amber[600];

  _TaskState({@required this.name, @required this.petName, bool isComplete});

  void _onTap() {
    setState(() {
      isComplete = !isComplete;
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
    if (isComplete) {
      return Icon(Icons.check_circle);
    }
    return Icon(Icons.radio_button_unchecked);
  }

  Widget info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name),
        Text(petName),
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
