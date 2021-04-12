import 'package:animazing/Models/User.dart';
import 'package:animazing/Pages/SetBody.dart';
import 'package:animazing/widgets/BottonNav.dart';
import 'package:animazing/Pages/TaskList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BasePage extends StatefulWidget {
  User currentUser;

  BasePage(User currentUser) {
    this.currentUser = currentUser;
  }

  @override
  _BasePageState createState() => _BasePageState(currentUser);
}


class _BasePageState extends State<BasePage> implements SetBody {
  Widget body = TaskList();
  User currentUser;

  _BasePageState(User currentUser) {
    this.currentUser = currentUser;
  }
  
  @override
  void setBody(Widget body) {
    setState(() {
      this.body = body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animazing'),
        ),
        body: body,
        bottomNavigationBar: BottomNav(this),
      ),
    );
  }


}