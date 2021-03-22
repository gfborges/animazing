import 'package:flutter/material.dart';
import 'package:animazing/Pages/Spending/components/SpendingList.dart';

// ignore: must_be_immutable
class MonthChanger extends StatefulWidget {
  SpendingList spendingList;
  MonthChanger({this.spendingList});

  @override
  _MonthChangerState createState() => _MonthChangerState();
}

class _MonthChangerState extends State<MonthChanger> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: null,
              )
            ]),
            Column(children: [
              Text("maio/2021",
                  style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.values[2]))
            ]),
            Column(children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: null,
              )
            ])
          ],
        ),
        widget.spendingList
      ],
    );
  }
}
