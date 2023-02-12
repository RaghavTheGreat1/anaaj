import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../models/donor_instituition.dart';
import '../../../../../models/order.dart';
import '../../../../../providers/app_user_providers.dart';
import '../../../../../widgets/brief_order_display_card.dart';
import '../../../providers/orders_list_stream_provider.dart';

class DonorOrdersList extends HookConsumerWidget {
  const DonorOrdersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DonorInstituition? donor = ref.watch(appUserProvider) != null
        ? ref.watch(appUserProvider)!.appUser as DonorInstituition
        : null;
    return Builder(
      builder: (context) {
        if (donor != null) {
          final snapshots = ref.watch(donorOrdersListStreamProvider(donor.id));
          return snapshots.when(
            data: (data) {
              final docs = data.docs;

              return SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final rawOrder = docs[index].data();
                      final parsedOrder = Order.fromJson(rawOrder);
                      return BriefOrderDisplayCard(
                        order: parsedOrder,
                        showDonor: true,
                        showReceiver: false,
                        onTap: () {
                          context.go(
                            '/donor/order/preview/',
                            extra: parsedOrder,
                          );
                        },
                      );
                    },
                    childCount: docs.length,
                  ),
                ),
              );
            },
            error: (error, stackTrace) {
              return SliverToBoxAdapter(
                child: Text('Error: ${error}'),
              );
            },
            loading: () {
              return SliverToBoxAdapter(
                child: SpinKitCubeGrid(
                  color: Theme.of(context).colorScheme.primary,
                ),
              );
            },
          );
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
