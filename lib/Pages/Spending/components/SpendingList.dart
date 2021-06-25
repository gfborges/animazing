import 'package:flutter/material.dart';
import 'package:animazing/Models/SpendingCardInfo.dart';

class SpendingCard extends StatelessWidget {
  final SpendingCardInfo cardInfo;
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
          Text(
            'R\$ ' + cardInfo.cost.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    height: 55,
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
          Container(
            padding: EdgeInsets.only(left: 50, right: 50),
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                Text(
                    'R\$ ' +
                        widget.list
                            .fold(0.0, (sum, item) => sum + item.cost)
                            .toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ))
              ],
            ),
            decoration: BoxDecoration(
                color: Color(0xff4a4356),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )
        ],
      ),
    );
  }
}
