import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal, required this.onToggleFav,});

  final Meal meal;
  final void Function(Meal meal)onToggleFav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed:  ()=> onToggleFav(meal),
            icon:  const Icon(Icons.favorite),
          ),
        ],
        title:const Text('Meal Detail')),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
              const SizedBox(height: 14,),
              Text("Ingredients", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),),
              const  SizedBox(height: 28,),
              for(final ingredient in meal.ingredients)
               Text(ingredient, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
               const SizedBox(height: 14,),
              Text("Steps", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),),
              const  SizedBox(height: 28,),
              for(final Steps in meal.steps)
               Padding(
                 padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                 ),
                 child: Text(Steps,
                 textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                             ),),
               ),
          ],
        ),
      ),
    );
  }
}