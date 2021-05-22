import 'package:animazing/Models/TaskBuilder.dart';

import 'package:intl/intl.dart';

class Task {
  static TaskBuilder taskBuilder = TaskBuilder();
  String name;
  double cost;
  String pet;
  String time;
  String frequency;
  String ownerId;


  bool isComplete = false;

  Task();

  void toggle() {
    this.isComplete = !this.isComplete;
  }

  String formatedTime() {
    return time;
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
