import 'package:anaaj/screens/donor/controllers/donor_bottom_nav_controller.dart';
import 'package:flutter/material.dart';

/// Screen having bottom navigation bar for authUser: Donor
class DonorBottomNavigationScreen extends StatefulWidget {
  const DonorBottomNavigationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DonorBottomNavigationScreen> createState() =>
      _DonorBottomNavigationScreenState();
}

class _DonorBottomNavigationScreenState
    extends State<DonorBottomNavigationScreen> {
  late ValueNotifier<int> currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        destinations: DonorBottomNavController.instance.navigationDestinations,
        onDestinationSelected: (value) {
          DonorBottomNavController.instance.index = value;
        },
      ),
      body: PageView(
        controller: DonorBottomNavController.instance.controller,
        physics: const NeverScrollableScrollPhysics(),
        children: DonorBottomNavController.instance.destinations,
      ),
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
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
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
