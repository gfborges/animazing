import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Pages/BodySetter.dart';
import 'package:animazing/Pages/TaskList.dart';
import 'package:animazing/widgets/BottonNav.dart';
import 'package:animazing/widgets/Background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animazing/colors.dart';

class BasePage extends StatefulWidget {
  BasePage();

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> implements BodySetter {
  Widget body;

  _BasePageState() {
    this.body = TaskList();
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
