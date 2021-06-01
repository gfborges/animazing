import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Models/Task.dart';
import 'package:animazing/Services/OwnerService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskRepository {
  CollectionReference<Task> collection;
  List<Task> _tasks;
  OwnerService userService = OwnerService.get();
  static TaskRepository _taskRepository;

  TaskRepository._() {
    collection =
      FirebaseFirestore.instance.collection('task').withConverter<Task>(
            fromFirestore: (snapshots, _) => Task.fromJson(snapshots.data()),
            toFirestore: (task, _) => task.toJson(),
          );
  }

  static TaskRepository get() {
    if (TaskRepository._taskRepository == null) {
      TaskRepository._taskRepository = TaskRepository._();
    }
    return TaskRepository._taskRepository;
  }

  void save(Task task) {
    if (hasTask(task.name)) {
      throw Exception("Can not insert task with same name");
    }
    collection.add(task)
      .then((value) => print("Task Added"))
      .catchError((error) => print("Failed to add user: $error"));
  }

  void delete(Task task) {
    print(task.id);
    collection.where("name", isEqualTo: task.name).get()
      .then((value) =>
        value.docs.forEach(
          (doc) => collection.doc(doc.id).delete()));
  }

  Stream<QuerySnapshot<Task>> getMany(Owner owner) {
    return collection
      .where("ownerId", isEqualTo: owner.id)
      .snapshots();
  }

  bool hasTask(String name) {
    return false;
  }
}
