import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

   //study 
    String get complexityText {// get 3la shakl dynamic
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 20,
      margin:const  EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child:InkWell(
        onTap:()=> onSelectMeal(meal),
        child: Stack
        (
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage) ,
              image: NetworkImage(meal.imageUrl)
               ),
               Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                 child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 44),
                    color: Colors.black54,
                   child: Column(
                    children: [
                      Text(meal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      overflow:TextOverflow.ellipsis ,
                      style: const 
                      TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                     const SizedBox(height: 12,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTriet(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 12),
                        MealItemTriet(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(width: 12),
                        MealItemTriet(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                    ],
                   ),
                 ),
               ),
        ],
        ),
      ) ,
    );
  }
}