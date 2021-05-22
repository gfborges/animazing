import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Models/Task.dart';
import 'package:animazing/Services/TaskService.dart';
import 'package:animazing/Store/Store.dart';
import 'package:animazing/widgets/ScreenTitle.dart';
import 'package:animazing/widgets/TaskCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final TaskService taskService = TaskService();
  Owner owner;

  TaskList({Key key}) {
    this.owner = Store.memory["currentOwner"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          greatings(),
          Divider(),
          image(),
          taskList(),
        ],
      ),
    );
  }

  Widget greatings() {
    return Center(
      child: Container(
        child: Column(
          children: [
            ScreenTitle(text: "Olá, ${owner.name.split(" ")[0]}!"),
            ScreenSubTitle(text: "Você tem 2 tarefas para concluir hoje!"),
          ],
        ),
        margin: EdgeInsets.only(top: 30),
      ),
    );
  }

  Widget image() {
    return Container(
      child: ClipOval(
        child: Image.network(
          owner.photoURL.split("=")[0],
          width: 150,
        ),
      ),
    );
  }

  Widget taskList() {
    Stream<QuerySnapshot<Task>> _tasks = taskService.getAll(owner);

    return Container(
      child: StreamBuilder<QuerySnapshot<Task>>(
        stream: _tasks,
        builder: (BuildContext context, snapshot) {
          final data = snapshot.requireData;
          List<TaskCard> tasks = data.docs.map((doc) => TaskCard(task:doc.data())).toList();
          return Column(
            children: tasks,
          );
        },
      ),
    );
  }
}
