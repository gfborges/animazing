import 'package:animazing/Models/Pet.dart';
import 'package:animazing/Models/Pets.dart';
import 'package:animazing/Models/Task.dart';
import 'package:animazing/Models/TaskBuilder.dart';

class TaskRepository {
  List<Task> _tasks;
  static TaskRepository _taskRepository;

  TaskRepository._() {
    _tasks = <Task>[
      TaskBuilder()
        .setName("Task 1")
        .setDateTime(DateTime.now())
        .setCost(200)
        .setPet(Pet(name:"Thor", type: Pets.bird))
        .get(),
      TaskBuilder()
        .setName("Task 2")
        .setDateTime(DateTime.now())
        .setCost(220)
        .setPet(Pet(name:"Thor", type: Pets.cat))
        .get()
    ];
  }

  static TaskRepository get() {
    if(TaskRepository._taskRepository == null) {
      TaskRepository._taskRepository = TaskRepository._();
    }
    return TaskRepository._taskRepository;
  }

  void save(Task task) {
    if( hasTask(task.name) ) {
      throw Exception("Can not insert task with same name");
    }
    _tasks.add(task);
  }

  Task getOne(String name) {
    return _tasks.firstWhere((task) => task.name == name);
  }

  List<Task> getMany() {
    return _tasks;
  }

  bool hasTask(String name) {
    return _tasks.any((task) => task.name == name);
  }
}