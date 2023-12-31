import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final String? title;

  const MealsScreen({super.key, required this.meals, this.title});

  @override
  Widget build(BuildContext context) {
    Widget mainContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(meal: meals[index]));

    if (meals.isEmpty) {
      mainContent = const Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "On ho!. There is no meals",
            style: TextStyle(color: Colors.white),
          )
        ],
      ));
    }
    if (title == null) {
      return mainContent;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: mainContent);
  }
}
