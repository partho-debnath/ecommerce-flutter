import 'package:flutter/material.dart';

import './category_list_screen.dart';
import './home_screen.dart';

class MainButtomNavBarScreen extends StatefulWidget {
  const MainButtomNavBarScreen({super.key});

  @override
  State<MainButtomNavBarScreen> createState() => _MainButtomNavBarScreenState();
}

class _MainButtomNavBarScreenState extends State<MainButtomNavBarScreen> {
  int _index = 0;
  final List<Widget> _screens = const <Widget>[
    HomeScreen(),
    CategoryListScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            tooltip: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Categories',
            tooltip: 'Categories',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            tooltip: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: 'Wish',
            tooltip: 'Wish',
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
