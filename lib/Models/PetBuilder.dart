import 'package:animazing/Models/Pet.dart';
import 'package:animazing/Models/Pets.dart';

class PetBuilder{
  Pet _pet;

  PetBuilder() {
    _reset();
  }

  PetBuilder _reset() {
    this._pet = new Pet();
    return this;
  }

  PetBuilder setName(String name) {
    this._pet.name = name;
    return this;
  }

   PetBuilder setType(Pets type) {
    this._pet.type = type;
    return this;
  }

  PetBuilder setOrigin(String origin){
    this._pet.origin = origin;
    return this;
  }


  Pet get() {
    Pet pet = this._pet;
    _reset();
    return pet;
  }


}