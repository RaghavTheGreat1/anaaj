import 'package:anaaj/models/food_item.dart';
import 'package:anaaj/models/marketplace_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorMarketplaceService {
  DonorMarketplaceService({
    required this.marketplaceEntity,
  });

  final MarketplaceEntity marketplaceEntity;

  String get donorId {
    return marketplaceEntity.donorInstituition.phoneNumber.toString();
  }

  final String marketplaceCollection = 'marketplace';

  Future<void> updateListingStatus(bool status) async {
    MarketplaceEntity entity = marketplaceEntity.copyWith(isListed: status);

    await FirebaseFirestore.instance
        .collection('marketplace')
        .doc(donorId)
        .set(entity.toJson());
  }

  Future<void> updateStatus(bool status) async {
    MarketplaceEntity entity = marketplaceEntity.copyWith(isOpen: status);

    await FirebaseFirestore.instance
        .collection('marketplace')
        .doc(donorId)
        .set(entity.toJson());
  }

  Future<void> addFoodItem(FoodItem foodItem) async {
    List<FoodItem> foodItems = marketplaceEntity.foodItems.toList();
    foodItems.add(foodItem);
    MarketplaceEntity entity = marketplaceEntity.copyWith(foodItems: foodItems);
    await FirebaseFirestore.instance
        .collection('marketplace')
        .doc(donorId)
        .set(entity.toJson());
  }

  Future<void> updateFoodItem(FoodItem foodItem) async {
    List<FoodItem> foodItems = marketplaceEntity.foodItems.toList();
    int index = foodItems.indexWhere(((element) => element.id == foodItem.id));
    foodItems.removeAt(index);
    foodItems.insert(index, foodItem);

    MarketplaceEntity entity = marketplaceEntity.copyWith(foodItems: foodItems);
    await FirebaseFirestore.instance
        .collection('marketplace')
        .doc(donorId)
        .set(entity.toJson());
  }

  Future<void> deleteFoodItem(FoodItem foodItem) async {
    List<FoodItem> foodItems = marketplaceEntity.foodItems.toList();
    int index = foodItems.indexOf(foodItem);
    foodItems.removeAt(index);
    MarketplaceEntity entity = marketplaceEntity.copyWith(foodItems: foodItems);
    await FirebaseFirestore.instance
        .collection('marketplace')
        .doc(donorId)
        .set(entity.toJson());
  }

  Future<void> deleteAllFoodItems() async {
    MarketplaceEntity entity = marketplaceEntity.copyWith(foodItems: []);
    await FirebaseFirestore.instance
        .collection('marketplace')
        .doc(donorId)
        .set(entity.toJson());
  }
}
