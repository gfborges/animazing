import 'package:animazing/Models/Pet.dart';

import 'package:intl/intl.dart';

class Task {
  final String name;
  final double cost; 
  final Pet pet;
  final DateTime time;

  static final DateFormat _formatter = DateFormat('HH:mm');

  bool isComplete = false;

  Task(this.name, this.pet, this.time, this.cost);

  void toggle() {
    this.isComplete = !this.isComplete;
  }

  String formatedTime() {
    return _formatter.format(this.time);
  }
}