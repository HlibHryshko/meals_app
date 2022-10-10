import 'package:flutter/material.dart';
import 'package:meals/data/data.dart';
import 'package:meals/pages/category_meals_page.dart';
import 'package:meals/pages/filters_page.dart';
import 'package:meals/pages/meal_details_page.dart';
import 'package:meals/pages/tabs_page.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };

  List<Meal> _availableMeals = meals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = meals.where((meal){
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
      ),
      routes: {
        // used for top navigation
        // '/': (ctx) => TabsPage(),
        // used for bottom navigation
        '/': (ctx) => TabsPage(),
        // '/': (ctx) => CategoriesPage(),
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(availableMeals: _availableMeals),
        MealDetailPage.routeName: (ctx) => MealDetailPage(),
        FiltersPage.routeName: (ctx) => FiltersPage(currentFilters: _filters, saveFilters: _setFilters),
      },
      // for the routes not in the routing table
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/meal-detail') {
      //     return ...;
      //   } else if (settings.name == '/something-else') {
      //     return ...;
      //   }
      //   return MaterialPageRoute(builder: (ctx) => CategoriesPage(),);
      // },

      // executed as the last function before an error
      // onUnknownRoute: (settings) {
      //   // could be 'we could not find this page'
      //   return MaterialPageRoute(builder: (ctx) => CategoriesPage(),);
      // },
    );
  }
}
