import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(this._toggleMealFavoriteStatus, {super.key});

  final void Function(Meal meal) _toggleMealFavoriteStatus;

  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          final List<Meal> filteredMeals = dummyMeals
              .where((meal) => meal.categories.contains(category.id))
              .toList();

          return MealsScreen(
            category.title,
            filteredMeals,
            _toggleMealFavoriteStatus,
          );
        },
      ),
    );
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(category, () {
            return _selectCategory(context, category);
          }),
      ],
    );
  }
}
