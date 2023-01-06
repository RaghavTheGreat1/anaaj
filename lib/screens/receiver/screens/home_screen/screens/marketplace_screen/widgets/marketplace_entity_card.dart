import 'package:anaaj/models/marketplace_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class MarketplaceEntityCard extends StatelessWidget {
  const MarketplaceEntityCard({
    Key? key,
    required this.marketplaceEntity,
  }) : super(key: key);

  final MarketplaceEntity marketplaceEntity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
      child: GestureDetector(
        onTap: () {
          context.go(
            '/receiver/entity/',
            extra: marketplaceEntity,
          );
        },
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.0),
          ),
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
            surfaceTintColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(17.0),
                  child: Image.network(
                    'https://www.deccanherald.com/sites/dh/files/article_images/2019/11/28/midday%20meal-1574890801.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            marketplaceEntity.donorInstituition.name,
                            style: theme.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            marketplaceEntity
                                .donorInstituition.address.streetAddress,
                            style: theme.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            "${marketplaceEntity.donorInstituition.address.city.trim()}, ${marketplaceEntity.donorInstituition.address.state}",
                            style: theme.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () async {
                              final Uri openDialer = Uri(
                                scheme: 'tel',
                                path: "+91" +
                                    marketplaceEntity
                                        .donorInstituition.phoneNumber
                                        .toString(),
                              );
                              await launchUrl(openDialer);
                            },
                            icon: Icon(Icons.phone_enabled_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
