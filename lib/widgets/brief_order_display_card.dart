import 'package:anaaj/models/order.dart';
import 'package:anaaj/models/order_status.dart';
import 'package:flutter/material.dart';

class BriefOrderDisplayCard extends StatelessWidget {
  const BriefOrderDisplayCard({
    Key? key,
    required this.order,
    this.onTap,
    required this.showDonor,
    required this.showReceiver,
  }) : super(key: key);

  final Order order;

  final VoidCallback? onTap;

  final bool showDonor;
  final bool showReceiver;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ID',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                order.id,
              ),
              Row(
                children: [
                  Text(
                    "Donor Instituition: \t",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    order.donorInstituition.name,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Recevier Instituition: \t",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    order.receiverInstituition.name,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Volunteer: \t",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    order.volunteer.name,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Order Status: \t",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    order.orderStatus.displayName,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "DateTime: \t",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    order.submissionDateTime.toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
