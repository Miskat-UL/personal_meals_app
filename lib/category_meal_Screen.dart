import 'package:flutter/material.dart';
import 'package:restrurent_app/meals_items.dart';
import 'dummy-data.dart';
import 'models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String mealsId;
  // final String mealsTitle;

  // CategoryMealsScreen(this.mealsId, this.mealsTitle);

  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String mealsTitle;
  List<Meal> displaymeal;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    mealsTitle = routesArgs['title'];
    final mealsId = routesArgs['id'];
    displaymeal = widget._availableMeals.where((meal) {
      return meal.categories.contains(mealsId);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displaymeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealsTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItems(
            title: displaymeal[index].title,
            affordability: displaymeal[index].affordability,
            imageUrl: displaymeal[index].imageUrl,
            complexity: displaymeal[index].complexity,
            duration: displaymeal[index].duration,
            id: displaymeal[index].id,
            removeItem: _removeMeal,
          );
        },
        itemCount: displaymeal.length,
      ),
    );
  }
}
