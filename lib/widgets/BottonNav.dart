import 'package:animazing/Pages/MapPage.dart';
import 'package:animazing/Pages/CreatePet/CreatePet.dart';
import 'package:animazing/Pages/BodySetter.dart';
import 'package:animazing/Pages/CreateTask/create_task.dart';
import 'package:animazing/Pages/TaskList.dart';
import 'package:animazing/Pages/Spending/SpendingPage.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  BodySetter page;
  
  BottomNav(this.page);

  @override
  _BottomNavState createState() => _BottomNavState(this.page);
}

class _BottomNavState extends State<BottomNav> {
  BodySetter page;

  _BottomNavState(this.page);

  int _currentIndex = 0;
  final items = [
    item(Icons.home_rounded, 'Home', TaskList()),
    item(Icons.pets_rounded, 'Pets', CreatePet()),
    item(Icons.add, 'Task', CreateTask()),
    item(Icons.account_balance_wallet_rounded, 'Wallet', SpendingPage()),
    item(Icons.room, 'Vets', MapsPage()),
  ];

  static MenuItem item(IconData icon, String label, Widget page) {
    return MenuItem(
        BottomNavigationBarItem(icon: Icon(icon), label: label), page);
  }

  _onItemTapped(BuildContext cSSontext) {
    return (int index) {
      setState(() {
        _currentIndex = index;
      });
      page.setBody(items[index].page); 
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: items.map((e) => e.item).toList(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        selectedIconTheme: IconThemeData(color: Colors.white70),
        unselectedIconTheme: IconThemeData(color: Colors.black87),
        onTap: _onItemTapped(context)));
  }
}

class MenuItem {
  final BottomNavigationBarItem item;
  final Widget page;

  MenuItem(this.item, this.page);
}
