
import 'package:animazing/Pages/BasePage.dart';
import 'package:animazing/Pages/create_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pages/LoginPage.dart';
import 'widgets/Tasks.dart';

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {

    final args = settings.arguments;

    switch(settings.name) {
      case '/login':
        return MaterialPageRoute( builder: (_) =>  LoginPage());
      case '/app':
        return MaterialPageRoute( builder: (_) =>  BasePage());  
    }
  }
}