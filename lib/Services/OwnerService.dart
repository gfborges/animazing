import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Models/Pet.dart';
import 'package:animazing/Repositories/OwnerRepository.dart';
import 'package:animazing/Store/Store.dart';

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

  addPet(Pet pet) async {
    Owner currentOwner = Store.memory["currentOwner"];
    currentOwner.pets.add(pet);

    this.ownerRepository.addPet(pet);
  }
}
