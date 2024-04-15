import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar(
      {super.key,
      required this.selectedIndex,
      required this.onDestinationSelected});

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: Colors.lightGreen[200],
      backgroundColor: Colors.green[50],
      onDestinationSelected: onDestinationSelected,
      selectedIndex: selectedIndex,
      height: 80,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.payment),
          icon: Icon(Icons.payment_outlined),
          label: 'Transaction',
        ),
      ],
    );
  }
}
