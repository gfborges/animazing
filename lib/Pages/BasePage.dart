import 'package:animazing/Pages/SetBody.dart';
import 'package:animazing/widgets/BottonNav.dart';
import 'package:animazing/widgets/Tasks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BasePage extends StatefulWidget {

  @override
  _BasePageState createState() => _BasePageState();
}


class _BasePageState extends State<BasePage> implements SetBody {
  Widget body = TaskList();

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