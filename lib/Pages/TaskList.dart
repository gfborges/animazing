import 'package:animazing/Models/Task.dart';
import 'package:animazing/Services/TaskService.dart';
import 'package:animazing/widgets/ScreenTitle.dart';
import 'package:animazing/widgets/TaskCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final TaskService taskService = TaskService();
  final User user;

  TaskList({Key key, this.user}) : super(key: key);

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
            ScreenTitle(text: "Olá, ${user.displayName.split(" ")[0]}!"),
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
          user.photoURL.split("=")[0],
          width: 150,
        ),
      ),
    );
  }

  Widget taskList() {
    List<Task> tasks = taskService.getAll();
    List<Widget> widgets = tasks
        .map((task) => TaskCard(
              task: task,
            ))
        .toList();

    return Container(
      child: Column(children: widgets),
    );
  }
}
