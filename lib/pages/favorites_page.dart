import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesPage({
    Key? key,
    required this.favoriteMeals
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'You have no favorites yet -> start adding some!'
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
