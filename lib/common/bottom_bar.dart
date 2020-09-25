import 'package:flutter/material.dart';

Widget bottomBar(BuildContext context, int index) => BottomNavigationBar(
  selectedItemColor: Theme.of(context).primaryColor.withOpacity(0.87),
  unselectedItemColor: Theme.of(context).primaryColor.withOpacity(0.60),
  backgroundColor: Theme.of(context).bottomAppBarColor,
  currentIndex: index,
  // this will be set when a new tab is tapped
  items: [
    BottomNavigationBarItem(
      icon: new Icon(Icons.library_books), // menu_book missing
      title: new Text('Catalog'),
    ),
    BottomNavigationBarItem(
      icon: new Icon(Icons.history),
      title: new Text('Order History'),
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), title: Text('Account'))
  ],
  onTap: (int newIndex) {
    if (newIndex == 0) {
      Navigator.pushNamed(context, "/catalog");
    }
    if (newIndex == 1) {
      Navigator.pushNamed(context, "/orders");
    }
    if (newIndex == 2) {
      Navigator.pushNamed(context, "/account");
    }
  },
);
