import 'package:animazing/Models/Pet.dart';

class User {
  final String name;
  List<Pet> pets = <Pet>[];

  User(this.name);

  void addPet(Pet pet) {
    this.pets.add(pet);
  }
}