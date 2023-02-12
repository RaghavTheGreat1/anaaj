import 'package:anaaj/screens/donor/controllers/donor_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controllers/volunteer_bottom_nav_controller.dart';

/// Screen having bottom navigation bar for authUser: Donor
class VolunteerBottomNavigationScreen extends StatefulWidget {
  const VolunteerBottomNavigationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VolunteerBottomNavigationScreen> createState() =>
      _VolunteerBottomNavigationScreenState();
}

class _VolunteerBottomNavigationScreenState
    extends State<VolunteerBottomNavigationScreen> {
  late ValueNotifier<int> currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        destinations:
            VolunteerBottomNavController.instance.navigationDestinations,
        onDestinationSelected: (value) {
          VolunteerBottomNavController.instance.index = value;
        },
      ),
      body: PageView(
        controller: VolunteerBottomNavController.instance.controller,
        physics: const NeverScrollableScrollPhysics(),
        children: VolunteerBottomNavController.instance.destinations,
      ),
    );
  }
}

class BottomNavigationBar extends StatefulHookConsumerWidget {
  const BottomNavigationBar({
    Key? key,
    required this.destinations,
    this.iconColor,
    required this.onDestinationSelected,
  }) : super(key: key);

  final ValueChanged<int> onDestinationSelected;
  final List<NavigationDestination> destinations;
  final MaterialStateProperty<Color?>? iconColor;

  @override
  ConsumerState<BottomNavigationBar> createState() =>
      _BottomNavigationBarState();
}

class _BottomNavigationBarState extends ConsumerState<BottomNavigationBar> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder<int>(
              valueListenable: currentIndex,
              builder: (context, index, _) {
                return NavigationBar(
                  selectedIndex: index,
                  onDestinationSelected: (value) {
                    currentIndex.value = value;
                    widget.onDestinationSelected(value);
                  },
                  destinations: widget.destinations,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
