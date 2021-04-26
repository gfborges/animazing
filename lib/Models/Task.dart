import 'package:animazing/Models/Frequency.dart';
import 'package:animazing/Models/Pet.dart';

import 'package:intl/intl.dart';

class Task {
  String name;
  double cost; 
  Pet pet;
  DateTime time;
  Frequency frequency;

  static final DateFormat _formatter = DateFormat('HH:mm');

  bool isComplete = false;

  Task();

  void toggle() {
    this.isComplete = !this.isComplete;
  }

  String formatedTime() {
    return _formatter.format(this.time);
  }
}