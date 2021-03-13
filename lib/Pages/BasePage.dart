import 'package:animazing/widgets/BottonNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePage extends StatelessWidget {

  BasePage({Key key});

  @protected
  Widget getBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animazing'),
        ),
        body: getBody(),
        bottomNavigationBar: bottomNav(),
      ),
    );
  }
}
