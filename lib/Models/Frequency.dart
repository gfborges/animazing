enum Frequency {
  unique,
  daily,
  weekly,
  monthly,
  anualy
}

extension ParseToString on Frequency {
  String toLabel() {
    switch(this) {
      case Frequency.unique :
        return "Não se repete";
      case Frequency.daily :
        return "Todos os dias";
      case Frequency.monthly:
        return "Mensalmente";
      case Frequency.anualy:
        return "Anualmente";
      default:
        return "Não reconhecido";
    }
  }
}