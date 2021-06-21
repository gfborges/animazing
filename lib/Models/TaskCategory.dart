enum TaskCategory {
  health,
  entertainment
}

extension ParseCateotryToString on TaskCategory {
  String toLabel() {
    switch(this) {
      case TaskCategory.health :
        return "Saúde";
      case TaskCategory.entertainment :
        return "Entreterimento";
      default:
        return "Não reconhecido";
    }
  }
}