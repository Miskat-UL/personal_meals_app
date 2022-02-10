import 'package:flutter/material.dart';
import 'package:restrurent_app/category_meal_Screen.dart';
import 'package:restrurent_app/dummy-data.dart';
import 'package:restrurent_app/filter_widget.dart';
import 'package:restrurent_app/meals_details_screen.dart';
import 'package:restrurent_app/models/meals.dart';
import 'package:restrurent_app/tabs_screen.dart';
import 'category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MY FOOD APP",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 52, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6:
                  TextStyle(fontSize: 24.0, fontFamily: 'RobotoCondensed'),
            ),
      ),
      home: TabsScreens(),
      routes: {
        '/category_meals': (ctx) => CategoryMealsScreen(_availableMeals),
        SingleMealItem.routeName: (ctx) => SingleMealItem(),
        FilterScreenWidget.routename: (ctx) => FilterScreenWidget(_filters, setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryScreen(),
        );
      },
    );
  }
}
