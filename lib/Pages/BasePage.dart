import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Pages/BodySetter.dart';
import 'package:animazing/Pages/TaskList.dart';
import 'package:animazing/widgets/BottonNav.dart';
import 'package:animazing/widgets/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animazing/colors.dart';

class BasePage extends StatefulWidget {
  final Owner owner;
 
  BasePage({this.owner});

  @override
  _BasePageState createState() => _BasePageState(owner);
}

class _BasePageState extends State<BasePage> implements BodySetter {
  Widget body;
  Owner owner;

  _BasePageState(this.owner);
  
  @override
  void setBody(Widget body) {
    setState(() {
      this.body = body;
    });
  }

  @override
  Widget build(BuildContext context) {
    body = TaskList(owner: owner);
    print("aqui ->" + owner.email);
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