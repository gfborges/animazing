import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Models/Pet.dart';
import 'package:animazing/Pages/Spending/components/MonthChanger.dart';
import 'package:animazing/Services/TaskService.dart';
import 'package:animazing/Store/Store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animazing/widgets/ScreenTitle.dart';
import 'package:animazing/Pages/Spending/components/SpendingList.dart';
import 'package:animazing/Models/SpendingCardInfo.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);
  List<dynamic> tasks;
  List categories = [
    "Entreterimento",
    "Comida",
    "Saúde",
    "Higiene",
    "Outro"
  ];

  Owner owner = Store.memory["currentOwner"];
  TaskService  taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<dynamic>> list = this.taskService.getAll(owner);

    return Container(
      child: Column(
        children: [
          Center(child: ScreenTitle(text: 'Gastos')), // Título da tela
          Center(child: ScreenSubTitle(text: 'Controle seus gastos mensais')), // Subtítulo
          Center(child: Image.asset('images/money.png')), // Imagem de dinheiro
          StreamBuilder(
            stream: list,
            builder:  (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                  final data  = snapshot.requireData;
                  tasks= data.docs.map((doc) {
                  return doc.data();
                }).toList();
              }
              var costPerPet = getCostPerPet(tasks);
              var spends = costPerPet.entries.map(
                (entry) => SpendingCardInfo(
                  Pet(name: entry.key),
                  DateTime(2021),
                  entry.value)).toList();
              return MonthChanger(
              spendingList: SpendingList(list: spends),
              );
            }
          ),
        ],
      ),
    );
  }

  Map getCostPerPet(List<dynamic> tasks){
    Map costPerPet = Map();
    for (var task in tasks) { 
      if(!costPerPet.containsKey(task.pet)) {
        costPerPet[task.pet] = categories.map((category) => 0).toList();
        
      } 
      if(task.cost != null) {
        costPerPet[task.pet] = costPerPet[task.pet].asMap().map((i,cost) {
          if(categories.indexOf(task.category) == i) {
            return MapEntry(i, cost + task.cost);
          }
          return MapEntry(i, cost);
        }).values.toList();
      }
    }
    return costPerPet;
  }
}
