import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.pets_rounded), label: 'Pets'),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Task'),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet_rounded), label: 'Wallet'),
    BottomNavigationBarItem(icon: Icon(Icons.room), label: 'Vets'),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: BottomNavigationBar(
      items: items,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _currentIndex,
      selectedIconTheme: IconThemeData(color: Colors.redAccent[100]),
      unselectedIconTheme: IconThemeData(color: Colors.black87),
      onTap: _onItemTapped
    ));
  }
}
