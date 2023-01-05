import 'package:anaaj/models/diet_type.dart';
import 'package:anaaj/models/food_item.dart';
import 'package:anaaj/screens/donor/providers/marketplace_entity_provider.dart';
import 'package:anaaj/widgets/tile_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../models/marketplace_entity.dart';
import '../../services/donor_marketplace_service.dart';
import 'widgets/add_food_item_menu.dart';

class DonorMenuScreen extends HookConsumerWidget {
  const DonorMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      GestureDetector(
                        onTap: () async {
                          MarketplaceEntity entity =
                              ref.read(marketplaceEntityProvider)!;
                          DonorMarketplaceService service =
                              DonorMarketplaceService(
                                  marketplaceEntity: entity);
                          await service.deleteAllFoodItems();
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
                        'Delete\nAll',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Divider(),
                Text('M E N U'),
                Divider(),
              ],
            ),
          ),
          HookConsumer(
            builder: (context, ref, _) {
              List<FoodItem> foodItems =
                  ref.watch(marketplaceEntityProvider)!.foodItems;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    FoodItem currentItem = foodItems[index];
                    return Column(
                      children: [
                        FoodItemTile(
                          foodItem: currentItem,
                        ),
                        Divider(
                          height: 0,
                        ),
                      ],
                    );
                  },
                  childCount: foodItems.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class FoodItemTile extends HookConsumerWidget {
  const FoodItemTile({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TileLayout(
      onTap: () {},
      listTile: ListTile(
        leading: Icon(foodItem.dietType.getIconData),
        title: Text(foodItem.name),
        subtitle: Text(foodItem.dietType.displayName),
        trailing: CupertinoSwitch(
          value: foodItem.stockStatus,
          onChanged: (value) async {
            MarketplaceEntity entity = ref.read(marketplaceEntityProvider)!;
            DonorMarketplaceService service =
                DonorMarketplaceService(marketplaceEntity: entity);
            FoodItem item = foodItem.copyWith(stockStatus: value);
            await service.updateFoodItem(item);
          },
        ),
      ),
    );
  }
}
