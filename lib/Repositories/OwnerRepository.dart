import 'package:animazing/Models/Owner.dart';

class OwnerRepository {
  List<Owner> _users;
  static OwnerRepository _taskRepository;

  OwnerRepository._() {
    _users = <Owner>[];
  }

  static OwnerRepository get() {
    if(OwnerRepository._taskRepository == null) {
      OwnerRepository._taskRepository = OwnerRepository._();
    }
    return OwnerRepository._taskRepository;
  }
}