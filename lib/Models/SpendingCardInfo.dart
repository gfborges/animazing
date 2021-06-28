import 'package:animazing/Models/Pet.dart';

class SpendingCardInfo {
  final List<dynamic> cost;
  final Pet pet;
  final DateTime time;

  SpendingCardInfo(this.pet, this.time, this.cost);
}
