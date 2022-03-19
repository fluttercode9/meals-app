import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/favorites_screen.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  Function tapHandler() {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
         
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'master chef',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 50,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.route);
          }),
        ],
      ),
    );
  }
}
