import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final String title;

  const MealsScreen({super.key, required this.meals, required this.title});

  @override
  Widget build(BuildContext context) {
    Widget mainContent = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => Text(meals[index].title),
    );

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
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: mainContent);
  }
}
