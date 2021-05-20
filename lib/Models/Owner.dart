import 'package:animazing/Models/Pet.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Owner {
  final String email;
  final String name;
  final String photoURL;
  List<Pet> pets;

  Owner({ this.email, this.name, this.photoURL}) {
    pets = <Pet>[];
  }

  void addPet(Pet pet) {
    this.pets.add(pet);
  }

  static Owner create(User user) {
    Owner owner = Owner(name: user.displayName, email: user.email, photoURL:user.photoURL);
    return owner;
  }
}