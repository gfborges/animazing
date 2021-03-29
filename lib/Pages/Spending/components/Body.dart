import 'package:animazing/Models/Pet.dart';
import 'package:animazing/Models/Pets.dart';
import 'package:animazing/Pages/Spending/components/MonthChanger.dart';
import 'package:flutter/material.dart';
import 'package:animazing/widgets/ScreenTitle.dart';
import 'package:animazing/Pages/Spending/components/SpendingList.dart';
import 'package:animazing/Models/SpendingCardInfo.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(child: ScreenTitle(text: 'Gastos')), // Título da tela
          Center(child: ScreenSubTitle(text: 'Controle seus gastos mensais')), // Subtítulo
          Center(child: Image.asset('images/money.png')), // Imagem de dinheiro
          MonthChanger(
            spendingList: SpendingList(list: [
              SpendingCardInfo(Pet("King Kong", Pets.cat), DateTime(2021), 1000.05),
              SpendingCardInfo(Pet("Rex", Pets.dog), DateTime(2021), 350.15),
              SpendingCardInfo(Pet("Galileu", Pets.bird), DateTime(2021), 80.35),
            ]),
          )
        ],
      ),
    );
  }
}
