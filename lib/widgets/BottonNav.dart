import 'package:flutter/material.dart';

BottomNavigationBar Function() bottomNav = () {
  return BottomNavigationBar(
          fixedColor: Colors.black87,
          unselectedItemColor: Colors.black87,
          unselectedLabelStyle: TextStyle(color: Colors.black87),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home' 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pets_rounded),
              label: 'Pets'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded),
              label: 'Wallet'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.room),
              label: 'Vets'
            ),
          ],
        );
};