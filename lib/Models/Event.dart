import 'package:animazing/Models/Task.dart';

class Event extends Task {

  @override
  String formatedTime() {
    return this.time;
  }
}