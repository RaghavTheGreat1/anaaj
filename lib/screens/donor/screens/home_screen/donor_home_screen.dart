import 'package:anaaj/models/donor_instituition.dart';
import 'package:anaaj/providers/app_user_providers.dart';
import 'package:anaaj/screens/donor/providers/marketplace_entity_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../models/marketplace_entity.dart';
import '../../services/donor_marketplace_service.dart';
import 'widgets/donor_orders_list.dart';

class DonorHomeScreen extends StatelessWidget {
  const DonorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
            ),
            SizedBox(
              width: 8,
            ),
            HookConsumer(
              builder: (context, ref, child) {
                DonorInstituition donor =
                    ref.watch(appUserProvider)!.appUser as DonorInstituition;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      donor.name,
                      style: theme.textTheme.titleSmall,
                    ),
                    Text(
                      donor.address.streetAddress,
                      style: theme.textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Listing Status'),
                                    HookConsumer(
                                      builder: (context, ref, _) {
                                        return CupertinoSwitch(
                                          value: ref.watch(
                                                      marketplaceEntityProvider) !=
                                                  null
                                              ? ref
                                                  .watch(
                                                      marketplaceEntityProvider)!
                                                  .isListed
                                              : false,
                                          onChanged: (value) async {
                                            MarketplaceEntity entity = ref.read(
                                                marketplaceEntityProvider)!;
                                            DonorMarketplaceService service =
                                                DonorMarketplaceService(
                                                    marketplaceEntity: entity);

                                            await service
                                                .updateListingStatus(value);
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Institution Open'),
                                    HookConsumer(
                                      builder: (context, ref, _) {
                                        return CupertinoSwitch(
                                          value: ref.watch(
                                                      marketplaceEntityProvider) !=
                                                  null
                                              ? ref
                                                  .watch(
                                                      marketplaceEntityProvider)!
                                                  .isOpen
                                              : false,
                                          onChanged: (value) async {
                                            MarketplaceEntity entity = ref.read(
                                                marketplaceEntityProvider)!;
                                            DonorMarketplaceService service =
                                                DonorMarketplaceService(
                                                    marketplaceEntity: entity);

                                            await service.updateStatus(value);
                                          },
                                        );
                                      },
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              child: Text(
                "Orders",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DonorOrdersList(),
        ],
      ),
    );
  }
}
