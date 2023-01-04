import 'package:anaaj/models/food_item.dart';
import 'package:riverpod/riverpod.dart';

class Cart extends StateNotifier<List<FoodItem>> {
  Cart([List<FoodItem>? initialCart]) : super(initialCart ?? []);

  void add(FoodItem foodItem) {
    state = [
      ...state,
      foodItem,
    ];
  }

  void remove(FoodItem foodItem_provided) {
    state =
        state.where((foodItem) => foodItem.id != foodItem_provided.id).toList();
  }

  void clear() {
    state = [];
  }
}

final cartProvider = StateNotifierProvider<Cart, List<FoodItem>>((ref) {
  return Cart([]);
});
