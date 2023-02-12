import 'package:anaaj/models/volunteer.dart';
import 'package:anaaj/screens/volunteer/providers/volunteer_orders_list_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../models/order.dart';
import '../../../../../providers/app_user_providers.dart';
import '../../../../../widgets/brief_order_display_card.dart';

class VolunteerOrdersList extends HookConsumerWidget {
  const VolunteerOrdersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Volunteer? volunteer = ref.watch(appUserProvider) != null
        ? ref.watch(appUserProvider)!.appUser as Volunteer
        : null;
    return Builder(
      builder: (context) {
        if (volunteer != null) {
          final snapshots =
              ref.watch(volunteerOrdersListStreamProvider(volunteer.id));
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
                        showReceiver: true,
                        onTap: () {
                          context.go(
                            '/volunteer/order/preview/',
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
