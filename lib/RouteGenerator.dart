
import 'package:animazing/Pages/create_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pages/LoginPage.dart';
import 'Pages/Tasks.dart';

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {

    final args = settings.arguments;
    switch(settings.name) {
      case '/login':
        return MaterialPageRoute( builder: (_) =>  LoginPage());
      case '/tasks':
        final DateTime pageArgs =  args; 
        return MaterialPageRoute(builder: (_) => Tasks(time: pageArgs));
      case '/create_task':
        return MaterialPageRoute( builder: (_) =>  CreateTask());  
    }
  }
}