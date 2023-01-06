import 'package:anaaj/screens/receiver/screens/home_screen/screens/marketplace_screen/marketplace_screen.dart';
import 'package:anaaj/screens/receiver/screens/order_history_screen/receiver_order_history_screen.dart';
import 'package:flutter/material.dart';

import '../screens/more_screen/receiver_more_screen.dart';

class ReceiverBottomNavController {
  ReceiverBottomNavController._();

  static ReceiverBottomNavController instance = ReceiverBottomNavController._();

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
          label: "Marketplace",
        ),
        NavigationDestination(
          icon: Icon(Icons.history_rounded),
          label: "History",
        ),
        NavigationDestination(
          icon: Icon(
            Icons.more_horiz_outlined,
          ),
          label: "More",
        ),
      ];

  List<Widget> get destinations => [
        ReceiverMarketplaceScreen(),
        ReceiverOrderHistoryScreen(),
        ReceiverMoreScreen(),
      ];
}
