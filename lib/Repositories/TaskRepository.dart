import 'package:animazing/Models/Task.dart';

class TaskRepository {
  List<Task> _tasks;
  static TaskRepository _taskRepository;

  TaskRepository._() {
    _tasks = <Task>[];
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