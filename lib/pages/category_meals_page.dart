import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../data/data.dart';

class CategoryMealsPage extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryId = routeArguments['id']!;
    final categoryTitle = routeArguments['title']!;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = categoryMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: categoryMeals.length,
      )
    );
  }
}
