import 'package:anaaj/models/donor_instituition.dart';
import 'package:anaaj/providers/app_user_providers.dart';
import 'package:anaaj/screens/donor/controllers/donor_bottom_nav_controller.dart';
import 'package:anaaj/screens/donor/providers/marketplace_entitiy_stream_provider.dart';
import 'package:anaaj/screens/donor/providers/marketplace_entity_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/marketplace_entity.dart';

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
    DonorInstituition donor =
        ref.read(appUserProvider)!.appUser as DonorInstituition;
    ref
        .watch(marketplaceEntityStreamProvider(donor.phoneNumber.toString()))
        .when(
      data: (value) {
        print('dataa');
        print(value);
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          final rawData = value.data();
          if (rawData != null) {
            ref.read(marketplaceEntityProvider.notifier).state =
                MarketplaceEntity.fromJson(Map.from(rawData));
            print(ref.read(marketplaceEntityProvider));
          } else {
            MarketplaceEntity entity = MarketplaceEntity.raw(donor);
            await FirebaseFirestore.instance
                .collection('marketplace')
                .doc(donor.phoneNumber.toString())
                .set(entity.toJson());
          }
        });
      },
      loading: () {
        print('loading');
      },
      error: (error, stackTrace) {
        print('erorrrrrr');

        print(error);
      },
    );
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
