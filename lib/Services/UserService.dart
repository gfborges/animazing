import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Repositories/OwnerRepository.dart';

class OwnerService {
  final OwnerRepository userRepository = OwnerRepository.get();
  static OwnerService userService;
  static OwnerService get() {
    if(OwnerService.userService == null) {
      OwnerService.userService = OwnerService();
    }
    return userService;
  }

  Owner currentUser;

  Owner getOne(String name) {
    return currentUser != null ? currentUser : currentUser = null;
  }
}