import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // Constructor
  FavoriteMealsNotifier() : super([]);

  // If a meal is not favorite, add it to the favorite list; 
  // otherwise, remove it from the favorite list
  bool toggleMealFavoriteStatus(Meal meal) {
    if (state.contains(meal)) {
      // Removing the meal from the favorite list
      state = state.where((m) => (m.id != meal.id)).toList();
      return false;
    } else {
      // Adding the meal to the favorite list (by spread operator)
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
