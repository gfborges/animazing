import 'package:animazing/Models/User.dart';
import 'package:animazing/Pages/SetBody.dart';
import 'package:animazing/Pages/TaskList.dart';
import 'package:animazing/widgets/BottonNav.dart';
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
  User currentUser;

  _BasePageState();
  
  @override
  void setBody(Widget body) {
    setState(() {
      this.body = body;
    });
  }

  @override
  Widget build(BuildContext context) {
    currentUser = ModalRoute.of(context).settings.arguments as User;

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