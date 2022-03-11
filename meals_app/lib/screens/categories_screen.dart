import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Meals '),),
        body: GridView(
          padding: EdgeInsets.all(10),
          children: DUMMY_CATEGORIES
              .map((e) => CategoryItem(e. id, e.title, e.color))
              .toList(),
          // [for(var i = 0 ; i<20; i++) Container( height: 100, width: 50, color: Colors.orange)],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ));
  }
}
