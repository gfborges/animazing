enum TaskCategory {
  health,
  hygiene,
  food,
  entertainment
}

extension ParseCateotryToString on TaskCategory {
  String toLabel() {
    switch(this) {
      case TaskCategory.health:
        return "Saúde";
      case TaskCategory.hygiene:
        return "Higiene";
      case TaskCategory.food:
        return "Comida";
      case TaskCategory.entertainment:
        return "Entreterimento";
      default:
        return "Não reconhecido";
    }
  }
}