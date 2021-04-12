import 'package:animazing/Models/Task.dart';
import 'package:animazing/Repositories/TaskRepository.dart';

class TaskService {
  TaskRepository taskRepository;

  TaskService() {
    taskRepository = TaskRepository.get(); 
  }

  List<Task> getAll() {
    return taskRepository.getMany();
  }
}