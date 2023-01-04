import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Restaurant Name',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Order ID: 123456',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Time of Delivery: 12:00 PM',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
