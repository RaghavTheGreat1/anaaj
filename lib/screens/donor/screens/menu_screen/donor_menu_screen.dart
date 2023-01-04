import 'package:anaaj/models/diet_type.dart';
import 'package:anaaj/models/food_item.dart';
import 'package:anaaj/providers/cart_provider.dart';
import 'package:anaaj/widgets/tile_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/add_food_item_menu.dart';

class DonorMenuScreen extends ConsumerWidget {
  const DonorMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return AddFoodItemMenu();
                          },
                        );
                      },
                      child: Card(
                        child: SizedBox.square(
                          dimension: 48,
                          child: Icon(
                            Icons.food_bank_outlined,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Add\nFood',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          ref.read(cartProvider).clear();
                        },
                        child: Text("Delete All")),
                    Card(
                      child: SizedBox.square(
                        dimension: 48,
                        child: Icon(
                          Icons.food_bank_outlined,
                        ),
                      ),
                    ),
                    Text(
                      'Delete\nAll',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                //TODO: Implement Foods List
                return Column(
                    children: cart
                        .map((foodItem) => Row(children: [
                              FoodItemTile(foodItem: foodItem),
                              Divider(
                                height: 0,
                              )
                            ]))
                        .toList());
                // [
                //   // FoodItemTile(
                //   //   foodItem: FoodItem.raw(),
                //   // ),
                //   Divider(
                //     height: 0,
                //   ),
                // ],
              },
              // childCount: 2,
            ),
          )
        ],
      ),
    );
  }
}

class FoodItemTile extends StatelessWidget {
  const FoodItemTile({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return TileLayout(
      onTap: () {},
      listTile: ListTile(
        leading: Icon(foodItem.dietType.getIconData),
        title: Text(foodItem.name),
        subtitle: Text(foodItem.dietType.displayName),
        trailing: CupertinoSwitch(
          value: foodItem.stockStatus,
          onChanged: (value) {
            //TODO: Implement stock disable
          },
        ),
      ),
    );
  }
}
