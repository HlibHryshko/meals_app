import 'package:flutter/material.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-details';

  const MealDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Details'
        ),
      ),
    );
  }
}
