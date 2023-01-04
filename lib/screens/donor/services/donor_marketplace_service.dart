import 'package:anaaj/models/donor_instituition.dart';
import 'package:anaaj/models/food_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorMarketplaceService {
  DonorMarketplaceService({
    required this.donorInstituition,
  });

  final DonorInstituition donorInstituition;

  final String marketplaceCollection = 'marketplace';

  Future<void> updateFoodItem(FoodItem foodItem) async {
    await FirebaseFirestore.instance
        .collection('marketplace')
        .doc(donorInstituition.id)
        .collection('food_items')
        .doc(foodItem.id)
        .set(foodItem.toJson());
  }

  Future<void> deleteFoodItem(FoodItem foodItem) async {
    await FirebaseFirestore.instance
        .collection('marketplace')
        .doc(donorInstituition.id)
        .collection('food_items')
        .doc(foodItem.id)
        .delete();
  }
}
