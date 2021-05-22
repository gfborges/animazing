import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Pages/BodySetter.dart';
import 'package:animazing/Pages/TaskList.dart';
import 'package:animazing/widgets/BottonNav.dart';
import 'package:animazing/widgets/Background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animazing/colors.dart';

class BasePage extends StatefulWidget {
  BasePage();

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> implements BodySetter {
  Widget body;

  _BasePageState() {
    this.body = TaskList();
  }

  @override
  void setBody(Widget body) {
    setState(() {
      this.body = body;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ownerRef =
        FirebaseFirestore.instance.collection('owner').withConverter<Owner>(
              fromFirestore: (snapshots, _) => Owner.fromJson(snapshots.data()),
              toFirestore: (owner, _) => owner.toJson(),
            );
    var isa = Owner();
    isa.email = "foliveira.isa@gmail.com";
    isa.name = "Isabelle Oliveira";
    isa.pets = [];
    isa.photoURL =
        "https://storage.googleapis.com/replit/images/1515121323216_fd6da27471bb9ef68e05dc236f61b0f1.png";
    ownerRef
        .add(isa)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
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
