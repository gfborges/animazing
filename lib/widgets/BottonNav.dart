import 'package:animazing/Pages/CreatePet.dart';
import 'package:animazing/Pages/SetBody.dart';
import 'package:animazing/Pages/create_task.dart';
import 'package:animazing/Pages/TaskList.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  SetBody page;
  
  BottomNav(this.page);

  @override
  _BottomNavState createState() => _BottomNavState(this.page);
}

class _BottomNavState extends State<BottomNav> {
  SetBody page;

  _BottomNavState(this.page);

  int _currentIndex = 0;
  final items = [
    item(Icons.home_rounded, 'Home', TaskList()),
    item(Icons.pets_rounded, 'Pets', CreatePet()),
    item(Icons.add, 'Task', CreateTask()),
    item(Icons.account_balance_wallet_rounded, 'Wallet', TaskList()),
    item(Icons.room, 'Vets', TaskList()),
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
            items: items.map((e) => e.item).toList(),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentIndex,
            selectedIconTheme: IconThemeData(color: Colors.redAccent[100]),
            unselectedIconTheme: IconThemeData(color: Colors.black87),
            onTap: _onItemTapped(context)));
  }
}

class MenuItem {
  final BottomNavigationBarItem item;
  final Widget page;

  MenuItem(this.item, this.page);
}
