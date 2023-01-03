import 'package:flutter/material.dart';

import 'widgets/add_food_item_menu.dart';

class DonorMenuScreen extends StatelessWidget {
  const DonorMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return AddFoodItemMenu();
                          },
                        );
                      },
                      child: Card(
                        child: SizedBox.square(
                          dimension: 48,
                          child: Icon(
                            Icons.food_bank_outlined,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Add\nFood',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    Card(
                      child: SizedBox.square(
                        dimension: 48,
                        child: Icon(
                          Icons.food_bank_outlined,
                        ),
                      ),
                    ),
                    Text(
                      'Delete\nAll',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                //TODO: Implement Foods List
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
