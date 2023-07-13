import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widget/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _onSelectCategory(BuildContext context, Category category) {
    var logger = Logger();
    final filteredMeals =
    dummyMeals.where((element) => element.categories.contains(category.id))
        .toList();

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MealsScreen(title: category.title, meals: filteredMeals);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return
      GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3 / 2, crossAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _onSelectCategory(context, category);
                })
        ],
      );
  }
}
