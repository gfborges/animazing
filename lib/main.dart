import 'package:animazing/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Services/AppBlocs.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animazing',
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generate,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ),
    );
  }
}