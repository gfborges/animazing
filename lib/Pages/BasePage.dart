import 'package:animazing/Pages/BodySetter.dart';
import 'package:animazing/Pages/TaskList.dart';
import 'package:animazing/widgets/BottonNav.dart';
import 'package:animazing/widgets/Background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animazing/colors.dart';

class BasePage extends StatefulWidget {
  final User user;
 
  BasePage({this.user});

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> implements BodySetter {
  Widget body;

  _BasePageState();
  
  @override
  void setBody(Widget body) {
    setState(() {
      this.body = body;
    });
  }

  @override
  Widget build(BuildContext context) {
    body = TaskList(user: widget.user);

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