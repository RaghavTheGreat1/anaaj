import 'package:anaaj/models/food_item.dart';
import 'package:anaaj/models/marketplace_entity.dart';
import 'package:anaaj/models/order.dart';
import 'package:anaaj/models/receiver_instituition.dart';
import 'package:anaaj/providers/app_user_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/buttons/cupertino_back_button.dart';
import 'screens/marketplace_screen/widgets/food_item_card.dart';

final foodCartProvider = StateProvider.autoDispose<List<FoodItem>>((ref) {
  return [];
});

class MarketplaceEntityScreen extends StatelessWidget {
  const MarketplaceEntityScreen({
    super.key,
    required this.entity,
  });

  final MarketplaceEntity entity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoBackButton(),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Card(
                                elevation: 0,
                                child: Container(
                                  height: 152,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              entity.donorInstituition.name,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              entity.donorInstituition.address
                                                  .streetAddress,
                                              style: theme.textTheme.labelLarge,
                                            ),
                                            Text(
                                              "${entity.donorInstituition.address.city.trim()}, ${entity.donorInstituition.address.state}",
                                              style: theme.textTheme.labelLarge,
                                            ),
                                            Text(
                                              "${entity.donorInstituition.address.pincode}",
                                              style: theme.textTheme.labelLarge,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                final Uri openDialer = Uri(
                                                  scheme: 'tel',
                                                  path: "+91" +
                                                      entity.donorInstituition
                                                          .phoneNumber
                                                          .toString(),
                                                );
                                                await launchUrl(openDialer);
                                              },
                                              icon: Icon(
                                                  Icons.phone_enabled_outlined),
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                final Uri emailLaunchUri = Uri(
                                                  scheme: 'mailto',
                                                  path: entity.donorInstituition
                                                      .emailAddress,
                                                );
                                                await launchUrl(emailLaunchUri);
                                              },
                                              icon: Icon(
                                                  Icons.mail_outline_rounded),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "M E N U",
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final foodItem = entity.foodItems[index];

                    return FoodItemCard(
                      foodItem: foodItem,
                    );
                  },
                  childCount: entity.foodItems.length,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 96),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: HookConsumer(
              builder: (context, ref, child) {
                final items = ref.watch(foodCartProvider);
                final isEmpty = items.isEmpty;
                final count = items.length;
                if (isEmpty) {
                  return SizedBox();
                } else {
                  return GestureDetector(
                    onTap: () {
                      final receiver = ref.watch(appUserProvider)!.appUser
                          as ReceiverInstituition;
                      Order order = Order.raw(
                        entity.donorInstituition,
                        receiver,
                      );
                      order = order.copyWith(foodItems: items);

                      context.push(
                        '/receiver/entity/order/review/',
                        extra: order,
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8.0),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 24.0,
                              horizontal: 24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${count} items"),
                                Row(
                                  children: [
                                    Text("proceed"),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
