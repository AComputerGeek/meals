// @author: Amir Armion
// @version: V.01

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(this.title, this.meals, {super.key});

  final String? title;
  final List<Meal> meals;

  void selectedMeal(BuildContext context, Meal meal) {
    // Navigator.pop(context); // If we push the back button, we will go to the main page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealDetailsScreen(meal);
        },
      ),
    );
  }

  @override
  Widget build(context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          meals[index],
          selectedMeal,
        );
      },
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Uh Oh! Nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18,
                  ),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
