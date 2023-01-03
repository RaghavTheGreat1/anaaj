import 'package:flutter/material.dart';

class MarketplaceEntityScreen extends StatefulWidget {
  const MarketplaceEntityScreen({super.key});

  @override
  State<MarketplaceEntityScreen> createState() =>
      _MarketplaceEntityScreenState();
}

class _MarketplaceEntityScreenState extends State<MarketplaceEntityScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Checkout'),
        ),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Image.network(
                      'https://www.deccanherald.com/sites/dh/files/article_images/2019/11/28/midday%20meal-1574890801.jpg',
                    ),
                    Text(
                      'Vijaya institution',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Display the food name
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 100,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Food Avaliable",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.food_bank)
                              ],
                            ),
                            Center(child: Text("Rice,Palya and Sambar")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Display the food descriptions
              Container(
                height: 400,
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Text('Food will be heated at 1:30'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Text(
                          'Food will be fresh for 7 hours in Summer and 5 hours in Winter'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Text('Approximately 100 meals will be left'),
                    ),
                    Container(
                      height: 100,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              width: 100,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 12,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),
                                          onPressed: () {
                                            // Handle button press
                                          },
                                          child: Text('Volunteers',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                        onPressed: () {
                                          // Handle button press
                                        },
                                        child: Text('Volunteers',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Display the food descriptionsc
            ],
          ),
        ),
      ),
    );
  }
}
