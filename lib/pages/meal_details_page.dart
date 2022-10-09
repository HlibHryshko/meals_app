import 'package:flutter/material.dart';
import 'package:meals/data/data.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-details';

  const MealDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = meals.firstWhere((meal) => meal.id == mealId);
    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
