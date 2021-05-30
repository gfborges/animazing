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
}