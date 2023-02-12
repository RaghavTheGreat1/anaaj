import 'package:anaaj/models/diet_type.dart';
import 'package:anaaj/models/order.dart';
import 'package:anaaj/screens/receiver/services/order_services.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../models/food_item.dart';
import '../../../../../../../widgets/tile_layout.dart';

class RecevierOrderReviewScreen extends StatelessWidget {
  const RecevierOrderReviewScreen({
    super.key,
    required this.order,
  });

  final Order order;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Order'),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Donor",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Card(
                            elevation: 0,
                            child: Container(
                              height: 175,
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
                                          order.donorInstituition.name,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          order.donorInstituition.address
                                              .streetAddress,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                        Text(
                                          "${order.donorInstituition.address.city.trim()}, ${order.donorInstituition.address.state}",
                                          style: theme.textTheme.labelLarge,
                                        ),
                                        Text(
                                          "${order.donorInstituition.address.pincode}",
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
                                                  order.donorInstituition
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
                                              path: order.donorInstituition
                                                  .emailAddress,
                                            );
                                            await launchUrl(emailLaunchUri);
                                          },
                                          icon:
                                              Icon(Icons.mail_outline_rounded),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Volunteer",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Card(
                            elevation: 0,
                            child: Container(
                              height: 175,
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
                                          order.volunteer.name,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          order.volunteer.address.streetAddress,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                        Text(
                                          "${order.volunteer.address.city.trim()}, ${order.volunteer.address.state}",
                                          style: theme.textTheme.labelLarge,
                                        ),
                                        Text(
                                          "${order.volunteer.address.pincode}",
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
                                                  order.volunteer.phoneNumber
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
                                              path:
                                                  order.volunteer.emailAddress,
                                            );
                                            await launchUrl(emailLaunchUri);
                                          },
                                          icon:
                                              Icon(Icons.mail_outline_rounded),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Receiver",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Card(
                            elevation: 0,
                            child: Container(
                              height: 175,
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
                                          order.receiverInstituition.name,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          order.receiverInstituition.address
                                              .streetAddress,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                        Text(
                                          "${order.receiverInstituition.address.city.trim()}, ${order.receiverInstituition.address.state}",
                                          style: theme.textTheme.labelLarge,
                                        ),
                                        Text(
                                          "${order.receiverInstituition.address.pincode}",
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
                                                  order.receiverInstituition
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
                                              path: order.receiverInstituition
                                                  .emailAddress,
                                            );
                                            await launchUrl(emailLaunchUri);
                                          },
                                          icon:
                                              Icon(Icons.mail_outline_rounded),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Food Items",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final currentFoodItem = order.foodItems[index];
                      return FoodItemCard(
                        foodItem: currentFoodItem,
                      );
                    },
                    childCount: order.foodItems.length,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 108,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () async {
                // TODO: Busy Volunteer
                await OrderServices().placeOrder(order);
                context.go(
                  '/receiver/order/preview/',
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
                          Row(
                            children: [
                              Text("place order"),
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
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    final foodImage = Faker().image.image(
      keywords: ['food', 'dish', 'cuisine'],
    );
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
          height: 72,
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
                            Text(
                              foodItem.dietType.displayName,
                              style: theme.textTheme.labelMedium!.copyWith(),
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
