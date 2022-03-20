import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/category_meals_screen.dart';
import 'package:flutter_complete_guide/screens/favorites_screen.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';
import 'package:flutter_complete_guide/screens/meal_details_screen.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": true,
    'lactose': false,
    'vegan': false,
    'vegetarian': true
  };
  List<Meal> availableMeals;
  void setFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters['gluten']) {
          return false;
        }
        if (!meal.isLactoseFree && _filters['lactose']) {
          return false;
        }
        if (!meal.isVegan && _filters['vegan']) {
          return false;
        }
        if (!meal.isVegetarian && _filters['vegetarian']) {
          return false;
        }
        if (!meal.isGlutenFree && _filters['gluten']) {
          return false;
        }
        return true;
      }).toList();
      print(availableMeals[2].id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        "/": (ctx) => TabScreen(),
        CategoryMealsScreen.route: (ctx) => CategoryMealsScreen(availableMeals),
        MealDetailsScreen.route: (ctx) => MealDetailsScreen(),
        FavoritesScreen.route: (ctx) => FavoritesScreen(),
        FiltersScreen.route: (ctx) => FiltersScreen(_filters, setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
