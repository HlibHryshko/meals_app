import 'package:flutter/material.dart';
import 'package:meals/pages/category_page.dart';
import 'package:meals/pages/favorites_page.dart';


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
