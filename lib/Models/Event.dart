import 'package:animazing/Models/Task.dart';
import 'package:intl/intl.dart';

class Event extends Task {
  static final DateFormat _formatter = DateFormat('yyyy/MM/dd HH:mm'); 
  Event();

  @override
  String formatedTime() {
    return _formatter.format(this.time);
  }
}