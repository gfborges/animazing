import 'package:animazing/Models/Pet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

class Owner {
  String email;
  String name;
  String photoURL;
  String id;
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

  static fromJson(Map<String, dynamic> json) {
    Owner owner = Owner(name: json["name"], email: json["email"], photoURL: json["photoURL"]);
    owner.pets = json["pets"];
    print(owner);
    return owner;
  }

  Map<String, Object> toJson() {
    var me  = Map<String, Object>();
    me["email"] = email;
    me["name"] = name;
    me["photoURL"] = photoURL;
    me["pets"] = [];
    return me;
  }
}