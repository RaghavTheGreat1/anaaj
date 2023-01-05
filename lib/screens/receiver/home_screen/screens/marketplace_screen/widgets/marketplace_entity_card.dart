import 'package:anaaj/models/marketplace_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarketplaceEntityCard extends StatelessWidget {
  const MarketplaceEntityCard({
    Key? key,
    required this.marketplaceEntity,
  }) : super(key: key);

  final MarketplaceEntity marketplaceEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
      child: GestureDetector(
        onTap: () {
          context.go(
            '/receiver/marketplace/entity/',
            extra: marketplaceEntity,
          );
        },
        child: SizedBox(
          width: 570,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(
                  'https://www.deccanherald.com/sites/dh/files/article_images/2019/11/28/midday%20meal-1574890801.jpg',
                  width: 400,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        marketplaceEntity.donorInstituition.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.verified_rounded,
                        size: 18,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Icon(
                        Icons.timelapse,
                        size: 18,
                        color: Colors.green,
                      ),
                    ),
                    Text("Fresh till almost 8:00pm")
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      marketplaceEntity.donorInstituition.address.streetAddress,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
