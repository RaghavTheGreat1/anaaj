import 'package:anaaj/models/marketplace_entity.dart';
import 'package:anaaj/models/receiver_instituition.dart';
import 'package:anaaj/providers/app_user_providers.dart';
import 'package:anaaj/screens/receiver/screens/home_screen/screens/marketplace_screen/providers/marketplace_stream_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/marketplace_entity_card.dart';

class ReceiverMarketplaceScreen extends HookConsumerWidget {
  const ReceiverMarketplaceScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final marketplaceStream = ref.watch(marketplaceStreamProvider);
    final receiver =
        ref.watch(appUserProvider)!.appUser as ReceiverInstituition;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.location_on_outlined),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              receiver.address.city,
              style: theme.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              receiver.address.streetAddress,
              style: theme.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.textTheme.labelLarge!.color!.withOpacity(0.50),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: marketplaceStream.when(
        data: (data) {
          final rawMarketplaceEntititesList = data.docs;
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final currentRawEntity = rawMarketplaceEntititesList[index];

                    final parsedEntity =
                        MarketplaceEntity.fromJson(currentRawEntity.data());
                    return MarketplaceEntityCard(
                      marketplaceEntity: parsedEntity,
                    );
                  },
                  childCount: rawMarketplaceEntititesList.length,
                ),
              ),
            ],
          );
        },
        error: ((error, stackTrace) {
          return SizedBox();
        }),
        loading: () {
          return SizedBox();
        },
      ),
    );
  }
}
