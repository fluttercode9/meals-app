import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String title;
  // final String id;
  // CategoryMealsScreen(this.id, this.title);
  static const route = "./category-meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(id: categoryMeals[index].id, affordability: categoryMeals[index].affordability, complexity: categoryMeals[index].complexity, duration: categoryMeals[index].duration, imageUrl: categoryMeals[index].imageUrl, title: categoryMeals[index].title,);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
