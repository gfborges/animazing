import 'package:animazing/Models/Owner.dart';
import 'package:animazing/RouteGenerator.dart';
import 'package:animazing/Store/Store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Store.memory["db"] = FirebaseFirestore.instance;
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animazing',
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generate,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}