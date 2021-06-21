import 'package:animazing/Models/Task.dart';

class TaskBuilder {
  Task _task;

  TaskBuilder() {
    _reset();
  }

  TaskBuilder _reset() {
    this._task = new Task();
    return this;
  }

  TaskBuilder setName(String name) {
    this._task.name = name;
    return this; 
  }
  
  TaskBuilder setCost(double cost) {
    this._task.cost = cost;
    return this;
  }

  TaskBuilder setPet(String pet) {
    this._task.pet = pet;
    return this;
  }

  TaskBuilder setCategory(String category) {
    return this;
  }

  TaskBuilder setTime(String time) {
    this._task.time = time;
    return this;
  }

  TaskBuilder setFrequency(String frequency) {
    this._task.frequency = frequency;
    return this;
  }

  TaskBuilder setOwner(String ownerId) {
    this._task.ownerId = ownerId;
    return this;
  }

  TaskBuilder setDate(String date) {
    this._task.date = date;
    return this;
  }
  
   TaskBuilder setIsComplete(bool isComplete) {
    this._task.isComplete = isComplete;
    return this;
  }
  
  Task get() {
    Task task = this._task;
    _reset();
    return task;
  }
}