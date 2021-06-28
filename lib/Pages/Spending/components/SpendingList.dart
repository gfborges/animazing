import 'package:flutter/material.dart';
import 'package:animazing/Models/SpendingCardInfo.dart';

class SpendingCard extends StatelessWidget {
  final SpendingCardInfo cardInfo;
  final List<Icon> catetoryIcons = [
    Icon(Icons.beach_access_rounded),
    Icon(Icons.food_bank_rounded),
    Icon(Icons.local_hospital_rounded),
    Icon(Icons.bathtub_rounded),
    Icon(Icons.more_horiz),
  ];
  SpendingCard({this.cardInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.ac_unit),
              Text(
                ' ' + cardInfo.pet.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),  
          Column(
            children: cardInfo.cost.asMap().map((i,e) => MapEntry(i, Row(children: [
              catetoryIcons.elementAt(i),
              Text(
                'R\$ ' + e.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )],))
            ).values.toList(),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SpendingList extends StatefulWidget {
  List<SpendingCardInfo> list;

  SpendingList({this.list});

  @override
  _SpendingListState createState() => _SpendingListState();
}

class _SpendingListState extends State<SpendingList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // limites da tela
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Column(
            children: widget.list
                .map(
                  (e) => Container(
                    child: SpendingCard(cardInfo: e),
                    height: 150,
                    width: size.width,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 4, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(1, 1),
                          )
                        ]),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
