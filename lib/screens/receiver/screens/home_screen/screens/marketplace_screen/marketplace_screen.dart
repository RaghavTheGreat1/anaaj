import 'package:anaaj/models/marketplace_entity.dart';
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
    final marketplaceStream = ref.watch(marketplaceStreamProvider);
    return marketplaceStream.when(
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
    );
  }
}
