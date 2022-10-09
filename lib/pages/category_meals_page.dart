import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {
  const CategoryMealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recipes'
        ),
      ),
      body: const Center(
        child: Text(
          'The recipes',
        ),
      ),
    );
  }
}
