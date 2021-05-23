import 'package:animazing/Models/Owner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OwnerRepository {
  CollectionReference<Owner> collection;
  static OwnerRepository _repository;

  OwnerRepository._() {
    collection =
        FirebaseFirestore.instance.collection('owner').withConverter<Owner>(
              fromFirestore: (snapshots, _) => Owner.fromJson(snapshots.data()),
              toFirestore: (owner, _) => owner.toJson(),
            );
  }

  static OwnerRepository get() {
    if (OwnerRepository._repository == null) {
      OwnerRepository._repository = OwnerRepository._();
    }
    return OwnerRepository._repository;
  }

  Future<void> save(Owner owner) async {
    var exists = await hasOwner(owner);
    if (!exists) {
      collection.doc(owner.id).set(owner);
    }
  }

  Future<bool> hasOwner(Owner owner) async {
    return (await collection.doc(owner.id).get()).exists;
  }
}
