import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';


class MealDetailsScreen extends StatelessWidget {

  final Meal meal;

  const MealDetailsScreen({super.key, required this.meal});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Container(
        child: Column(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }

}
