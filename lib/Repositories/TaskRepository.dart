import 'package:animazing/Models/Pet.dart';
import 'package:animazing/Models/Pets.dart';
import 'package:animazing/Models/Task.dart';
import 'package:animazing/Models/TaskBuilder.dart';
import 'package:animazing/Services/UserService.dart';

class TaskRepository {
  List<Task> _tasks;
  UserService userService = UserService.get();
  static TaskRepository _taskRepository;

  TaskRepository._() {
    List<Pet> pets = userService.currentUser.pets;
    _tasks = <Task>[
      TaskBuilder()
        .setName("Task 1")
        .setDateTime(DateTime.now())
        .setCost(200)
        .setPet(pets.firstWhere( (p) => p.name == "Thor"))
        .get(),
      TaskBuilder()
        .setName("Task 2")
        .setDateTime(DateTime.now())
        .setCost(220)
        .setPet(pets.firstWhere( (p) => p.name == "Nico"))
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