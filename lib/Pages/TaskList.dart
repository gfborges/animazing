import 'package:animazing/Models/Task.dart';
import 'package:animazing/Services/TaskService.dart';
import 'package:animazing/widgets/TaskCard.dart';
import 'package:flutter/material.dart';


class TaskList extends StatelessWidget {
  final TaskService taskService = TaskService(); 

  TaskList({Key key}) : super(key: key);

  Widget greatings() {
    return Center(
      child: Container(
        child: Text('Welcome, Gefferson'),
        margin: EdgeInsets.only(top: 30),
      ),
    );
  }

  Widget image() {
    return Container(
        child: Image.network(
      'https://i.imgur.com/zc2JfLO.jpg',
      height: 150,
    ));
  }

  Widget taskList() {
    List<Task> tasks = taskService.getAll();
    List<Widget> widgets = tasks.map((task) => TaskCard(task: task,)).toList();

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: widgets
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            greatings(),
            image(),
            taskList(),
          ],
        ),
      ),
    );
  }
}