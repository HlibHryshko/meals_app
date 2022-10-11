import 'package:flutter/material.dart';
import 'package:meals/pages/category_page.dart';
import 'package:meals/pages/favorites_page.dart';
import 'package:meals/widgets/main_drawer.dart';

import '../models/meal.dart';


/*
tabsPage class for top Navigation
 */
// class TabsPage extends StatefulWidget {
//   const TabsPage({Key? key}) : super(key: key);
//
//   @override
//   State<TabsPage> createState() => _TabsPageState();
// }
//
// class _TabsPageState extends State<TabsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Meals'),
//             bottom: TabBar(
//               tabs: [
//                 Tab(
//                   icon: Icon(Icons.category),
//                   text: 'Categories',
//                 ),
//                 Tab(
//                   icon: Icon(Icons.star),
//                   text: 'Favorites',
//                 ),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               CategoriesPage(),
//               FavoritesPage(),
//             ],
//           ),
//         ),
//     );
//   }
// }

/*
tabsPage for bottom navigation bar
 */
class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsPage({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _pages = [
      {
        'page': CategoriesPage(),
        'title': 'Categories',
      },
      {
        'page': FavoritesPage(favoriteMeals: widget.favoriteMeals),
        'title': 'Favorites'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages![_selectedPageIndex]['title'] as String,
        ),
      ),
      drawer: MainDrawer(),
      body: _pages![_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        // not used for shifting type
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        // used to set up the type of the bottom navigation bar
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            // used for shifting type
            // backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            // used for shifting type
            // backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
