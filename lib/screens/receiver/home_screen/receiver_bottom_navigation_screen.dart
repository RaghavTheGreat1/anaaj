import 'package:flutter/material.dart';

import 'screens/marketplace_screen/marketplace_screen.dart';

class ReceiverBottomNaviagationScreen extends StatefulWidget {
  const ReceiverBottomNaviagationScreen({super.key});

  @override
  State<ReceiverBottomNaviagationScreen> createState() =>
      _ReceiverBottomNaviagationScreenState();
}

class _ReceiverBottomNaviagationScreenState
    extends State<ReceiverBottomNaviagationScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MarketPlace'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amberAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_rounded), label: 'Institututions'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          onTap: _onItemTapped,
        ),
        backgroundColor: Colors.white,
        body: MarketplaceScreen(),
      ),
    );
  }
}
