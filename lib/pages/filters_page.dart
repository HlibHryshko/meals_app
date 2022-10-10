import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersPage extends StatelessWidget {
  static const routeName = '/filters';

  const FiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
        ),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
          'Filters'
        )
      ),
    );
  }
}
