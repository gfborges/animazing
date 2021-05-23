import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Repositories/OwnerRepository.dart';

class OwnerService {
  final OwnerRepository ownerRepository = OwnerRepository.get();
  static OwnerService userService;

  static OwnerService get() {
    if (OwnerService.userService == null)
      OwnerService.userService = OwnerService();

    return userService;
  }

  save(Owner owner) async {
    return await ownerRepository.save(owner);
  }
}
