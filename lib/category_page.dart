import 'package:flutter/material.dart';
import 'package:meals/category_item.dart';

import './data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: categories.map((category) {
          return CategoryItem(title: category.title, color: category.color);
        }).toList(),
      ),
    );
  }
}
