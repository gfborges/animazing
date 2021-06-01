import 'package:animazing/Models/Pets.dart';

class Pet {
  String name;
  Pets type;
  String origin;

  Pet({ this.name, this.type, this.origin});

  Map<String, Object> toJson() {
    return <String, Object>{
      "name": name,
      "type": type.toString(),
      "origin": origin,
    };
  }

  static Pet fromJson(Map<String, Object> json) {
    return Pet(
      name: json["name"],
      origin: json["origin"],
      type: PetsExtenstion.parse(json["type"])
    );

  }
}