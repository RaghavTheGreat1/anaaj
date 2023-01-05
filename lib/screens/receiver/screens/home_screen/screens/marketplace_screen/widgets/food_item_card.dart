import 'package:anaaj/widgets/tile_layout.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../models/food_item.dart';
import '../../../marketplace_entity_screen.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    Key? key,
    required this.foodItem,
    required this.foodImage,
  }) : super(key: key);

  final FoodItem foodItem;

  final String foodImage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      surfaceTintColor: Colors.white,
      child: TileLayout(
        onTap: () {},
        listTile: SizedBox(
          height: 108,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              foodItem.name,
                              style: theme.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            HookConsumer(
                              builder: (context, ref, _) {
                                bool isAdded = ref
                                    .watch(foodCartProvider)
                                    .contains(foodItem);
                                return OutlinedButton.icon(
                                  onPressed: () {
                                    final items =
                                        ref.read(foodCartProvider).toList();
                                    if (isAdded) {
                                      items.remove(foodItem);
                                      ref
                                          .read(foodCartProvider.notifier)
                                          .state = items;
                                    } else {
                                      items.add(foodItem);
                                      ref
                                          .read(foodCartProvider.notifier)
                                          .state = items;
                                    }
                                  },
                                  label: Text(isAdded ? "added" : "add"),
                                  icon: Icon(isAdded
                                      ? Icons.done_rounded
                                      : Icons.add_rounded),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Image.network(
                      foodImage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
