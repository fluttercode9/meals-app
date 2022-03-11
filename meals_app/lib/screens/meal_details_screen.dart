import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const route = '/meal-details';






  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      
      body: Center(child: Text('the meal is $mealId'),
       
        
      ),
    );
  }
}