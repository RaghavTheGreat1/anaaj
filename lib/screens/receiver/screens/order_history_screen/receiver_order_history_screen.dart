import 'package:anaaj/screens/receiver/screens/order_history_screen/widgets/receiver_order_list.dart';
import 'package:flutter/material.dart';

class ReceiverOrderHistoryScreen extends StatelessWidget {
  const ReceiverOrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: CustomScrollView(
        slivers: [
          ReceiverOrdersList(),
        ],
      ),
    );
  }
}
