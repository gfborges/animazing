
import 'package:animazing/Pages/BasePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pages/Login/LoginPage.dart';

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