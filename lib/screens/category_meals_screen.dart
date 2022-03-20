import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = '/category-meals';
  List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayedMeals;
  String categoryTitle;
  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeMeal(mealId) {
    setState(() {});
    displayedMeals.removeWhere((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            removeItem: removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
