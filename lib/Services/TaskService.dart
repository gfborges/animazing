import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Models/Task.dart';
import 'package:animazing/Repositories/TaskRepository.dart';

class TaskService {
  TaskRepository taskRepository;

  TaskService() {
    taskRepository = TaskRepository.get(); 
  }

  getAll(Owner owner) {
    return taskRepository.getMany(owner);
  }

  save(Task task) {
    return taskRepository.save(task);
  }
}