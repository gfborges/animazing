import 'package:animazing/Pages/SetBody.dart';
import 'package:animazing/widgets/BottonNav.dart';
import 'package:animazing/widgets/Tasks.dart';
import 'package:animazing/widgets/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animazing/colors.dart';

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
        body: SingleChildScrollView(child: Background(screen: body)),
        // tem que fazer essa gambiarra pra mudar a cor zzz
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(canvasColor: navbar_purple),
          child: BottomNav(this),
        ),
      ),
    );
  }
}