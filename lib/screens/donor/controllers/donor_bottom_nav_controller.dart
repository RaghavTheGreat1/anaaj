import 'package:anaaj/screens/donor/screens/home_screen/donor_home_screen.dart';
import 'package:anaaj/screens/donor/screens/menu_screen/donor_menu_screen.dart';
import 'package:anaaj/screens/donor/screens/more_screen/donor_more_screen.dart';
import 'package:flutter/material.dart';

class DonorBottomNavController {
  DonorBottomNavController._();

  static DonorBottomNavController instance = DonorBottomNavController._();

  PageController _controller = PageController(
    initialPage: 0,
  );

  PageController get controller => _controller;

  int _index = 0;

  int get index => _index;

  set index(int index) {
    _index = index;
    controller.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInExpo,
    );
  }

  List<NavigationDestination> get navigationDestinations => [
        NavigationDestination(
          icon: Icon(Icons.dashboard),
          label: "Dashboard",
        ),
        NavigationDestination(
          icon: Icon(
            Icons.food_bank_outlined,
          ),
          label: "Menu",
        ),
        NavigationDestination(
          icon: Icon(
            Icons.more_horiz_outlined,
          ),
          label: "More",
        ),
      ];

  List<Widget> get destinations => [
        DonorHomeScreen(),
        DonorMenuScreen(),
        DonorMoreScreen(),
      ];
}
