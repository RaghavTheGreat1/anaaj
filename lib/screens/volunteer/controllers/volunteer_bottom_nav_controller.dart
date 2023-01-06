import 'package:anaaj/screens/volunteer/more_screen/volunteer_more_screen.dart';
import 'package:anaaj/screens/volunteer/volunteer_current_order_screen.dart';
import 'package:anaaj/screens/volunteer/volunteer_order_history_screen.dart';
import 'package:flutter/material.dart';

class VolunteerBottomNavController {
  VolunteerBottomNavController._();

  static VolunteerBottomNavController instance =
      VolunteerBottomNavController._();

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
            Icons.history_rounded,
          ),
          label: "Order History",
        ),
        NavigationDestination(
          icon: Icon(
            Icons.more_horiz_outlined,
          ),
          label: "More",
        ),
      ];

  List<Widget> get destinations => [
        VolunteerCurrentOrderScreen(),
        VolunteerOrderHistoryScreen(),
        VolunteerMoreScreen(),
      ];
}
