

import 'package:animazing/widgets/BottonNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Page extends StatelessWidget {
  @protected Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Animazing'),
          ),
          body: body,
          bottomNavigationBar: bottomNav(),),
    );
  }
}