import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../data/data.dart';
import '../models/meal.dart';

class CategoryMealsPage extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsPage({Key? key}) : super(key: key);

  @override
  State<CategoryMealsPage> createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loadedInitData) {
      final routeArguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      final categoryId = routeArguments['id']!;
      categoryTitle = routeArguments['title']!;
      displayedMeals = meals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = displayedMeals![index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
            complexity: meal.complexity,
            affordability: meal.affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals?.length,
      )
    );
  }
}
