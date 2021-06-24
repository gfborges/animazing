import 'package:animazing/Models/Frequency.dart';
import 'package:animazing/Models/TaskBuilder.dart';

import 'package:intl/intl.dart';

class Task {
  static TaskBuilder taskBuilder = TaskBuilder();
  String name;
  double cost;
  String pet;
  String time;
  String date;
  String frequency;
  String ownerId;
  String _id;
  String category;

  bool isComplete = false;

  Task(){
    isComplete = false;
    date = "";
  }

  void toggle() {
    this.isComplete = !this.isComplete;
  }

  String formatedTime() {
    if(frequency != Frequency.daily.toLabel()) {
      return  date + " " + time;
    } 
    return time;
  }

  static fromJson(Map<String, Object> json) {
    Task task = taskBuilder
        .setName(json["name"])
        .setCost(json["cost"])
        .setTime(json["time"])
        .setDate(json["date"])
        .setFrequency(json["frequency"])
        .setPet(json["pet"])
        .setOwner(json["ownerId"])
        .setIsComplete(json["isComplete"])
        .get();
    task._id = json["id"];
    
    return task;
  }

  get id {
    return _id;
  }

  Map<String, Object> toJson() {
    Map<String, Object> json = Map();
    json["name"] = name;
    json["cost"] = cost;
    json["pet"] = pet;
    json["time"] = time;
    json["frequency"] = frequency;
    json["ownerId"] = ownerId;
    json["date"] = date;
    json["id"] = _id;
    json["ownerId"] = ownerId;
    json["isComplete"] = isComplete;
    return json;
  }
}
