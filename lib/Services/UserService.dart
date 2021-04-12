import 'package:animazing/Models/User.dart';
import 'package:animazing/Repositories/UserRepository.dart';

class UserService {
  final UserRepository userRepository = UserRepository.get();

  UserService();

  User getOne(String name) {
    return userRepository.getOne(name);
  }
}