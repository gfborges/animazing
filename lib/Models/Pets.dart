enum Pets { cat, dog, bird, rodent }

extension PetsExtenstion on Pets {
  static Pets parse(String str) {
    switch (str) {
      case "Pets.cat":
        return Pets.cat;
      case "Pets.dog":
        return Pets.cat;
      case "Pets.bird":
        return Pets.cat;
      case "Pets.rodent":
        return Pets.cat;
    }
  }
}
