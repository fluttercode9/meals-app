import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

Widget buildSectionTitle(BuildContext context, String text) {
  return Container(
    margin: EdgeInsets.all(5),
    color: Colors.black12,
    width: double.infinity,
    child: Center(
      child: Text(
        '$text:',
        style: Theme.of(context).textTheme.headline6,
      ),
    ),
  );
}

Widget buildScrollableList(BuildContext context, List<String> listInMeal) {
  return Container(
    margin: EdgeInsets.all(2),
    color: Colors.black12,
    height: MediaQuery.of(context).size.height * 0.22,
    child: RawScrollbar(
      thumbColor: Colors.pink,
      isAlwaysShown: true,
      // child: ListView(
      //     children: (listInMeal.map(
      //   (e) => Card(
      //     elevation: 22,
      //     child: Text(e),
      //   ),
      // )).toList()),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text('${listInMeal[index]}')),
            ],
          );
        },
        itemCount: listInMeal.length,
      ),
    ),
  );
}

class MealDetailsScreen extends StatelessWidget {
  static const route = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final passedArgs =
        ModalRoute.of(context).settings.arguments as passArguments;
    final mealId = passedArgs.id;
    final affordability = passedArgs.affordabilityText;
    final complexity = passedArgs.complexityText;

    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    final isVegan = selectedMeal.isVegan;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              Navigator.of(context).pop(mealId);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl),
          ),
          buildSectionTitle(context, 'Ingredients:'),
          buildScrollableList(context, selectedMeal.ingredients),
          buildSectionTitle(context, 'Steps:'),
          buildScrollableList(context, selectedMeal.steps),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(
              children: [
                Row(children: [
                  Icon(Icons.access_alarm),
                  Text('${selectedMeal.duration}')
                ]),
                Row(
                  children: [
                    Icon(Icons.accessibility_new_sharp),
                    Text('$affordability, $complexity,'),
                    isVegan
                        ? Text(
                            '  vegan',
                            style: TextStyle(color: Colors.green[300]),
                          )
                        : Container()
                  ],
                )
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
