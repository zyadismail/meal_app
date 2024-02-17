import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';


class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals, required this.onToggleFav,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal)onToggleFav;


  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map(
              (meal) => MealItem(
                meal: meal,
                onSelectMeal: (Meal meal) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => MealDetailScreen(meal: meal, onToggleFav: onToggleFav,),
                    ),
                  );
                },
              ),
            ) .toList(),
      ),
    );
  }
}
