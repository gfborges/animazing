import 'package:animazing/Models/User.dart';

class UserRepository {
  List<User> _users;
  static UserRepository _taskRepository;

  UserRepository._() {
    _users = <User>[User("test-user")];
  }

  static UserRepository get() {
    if(UserRepository._taskRepository == null) {
      UserRepository._taskRepository = UserRepository._();
    }
    return UserRepository._taskRepository;
  }

  User getOne(String name) {
    return _users.firstWhere((task) => task.name == name);
  }

  bool hasUser(String name) {
    return _users.any((task) => task.name == name);
  }
}