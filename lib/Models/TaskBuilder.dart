import 'package:animazing/Models/Frequency.dart';
import 'package:animazing/Models/Pet.dart';
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

  TaskBuilder setPet(Pet pet) {
    this._task.pet = pet;
    return this;
  }

  TaskBuilder setDateTime(DateTime time) {
    this._task.time = time;
    return this;
  }

  TaskBuilder setFrequency(Frequency frequency) {
    this._task.frequency = frequency;
    return this;
  }
  
  Task get() {
    Task task = this._task;
    _reset();
    return task;
  }
}