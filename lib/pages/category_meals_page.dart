import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryId = routeArguments['id']!;
    final categoryTitle = routeArguments['title']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle
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
