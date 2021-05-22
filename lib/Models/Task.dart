import 'package:animazing/Models/Frequency.dart';
import 'package:animazing/Models/Pet.dart';
import 'package:animazing/Models/TaskBuilder.dart';

import 'package:intl/intl.dart';

class Task {
  static TaskBuilder taskBuilder = TaskBuilder();
  String name;
  double cost;
  Pet pet;
  DateTime time;
  String frequency;
  String ownerId;

  static final DateFormat _formatter = DateFormat('HH:mm');

  bool isComplete = false;

  Task();

  void toggle() {
    this.isComplete = !this.isComplete;
  }

  String formatedTime() {
    return _formatter.format(this.time);
  }

  static fromJson(Map<String, Object> json) {
    Task task = taskBuilder
        .setName(json["name"])
        .setCost(json["cost"])
        .setDateTime(json["time"])
        .setFrequency(json["frequency"])
        .setPet(json["pet"])
        .setOwner(json["email"])
        .get();
    return task;
  }

  Map<String, Object> toJson() {
    Map<String, Object> json = Map();
    json["name"] = name;
    json["cost"] = cost;
    json["pet"] = pet;
    json["time"] = time;
    json["frequency"] = frequency;
    json["ownerId"] = ownerId;
    return json;
  }
}
