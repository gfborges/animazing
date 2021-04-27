import 'package:animazing/Models/Pet.dart';
import 'package:animazing/Models/Pets.dart';
import 'package:animazing/Models/User.dart';
import 'package:animazing/Repositories/UserRepository.dart';

class UserService {
  final UserRepository userRepository = UserRepository.get();
  static UserService userService;
  static UserService get() {
    if(UserService.userService == null) {
      UserService.userService = UserService();
    }
    return userService;
  }

  User currentUser;

  User getOne(String name) {
    return currentUser != null ? currentUser : currentUser = mockOne();
  }

  User mockOne() {
    User user = User("mock-user");
    user.addPet(Pet(name: "Nico", type: Pets.cat));
    user.addPet(Pet(name: "Hamtaro", type: Pets.rodent));
    user.addPet(Pet(name: "Cerberus", type: Pets.dog));
    user.addPet(Pet(name: "Thor", type: Pets.bird));
    return user;
  }
}