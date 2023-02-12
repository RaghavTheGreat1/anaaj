import 'package:anaaj/screens/volunteer/widgets/volunteer_orders_list.dart';
import 'package:flutter/material.dart';

class VolunteerOrderHistoryScreen extends StatefulWidget {
  const VolunteerOrderHistoryScreen({super.key});

  @override
  State<VolunteerOrderHistoryScreen> createState() => _VolunteerOrderHistoryScreenState();
}

class _VolunteerOrderHistoryScreenState extends State<VolunteerOrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body:  CustomScrollView(
        slivers: [
          VolunteerOrdersList(),
        ],
      ),
    );
  }
}
