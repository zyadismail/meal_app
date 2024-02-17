import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSetect});


  final void Function(String identifer)onSetect;

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding:  const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                ] 
                ),
            ),
             child: Row(
              children: [
               Icon(Icons.fastfood,
               color: Theme.of(context).colorScheme.primary,
               size: 48,
               ),
               const SizedBox(width:18 ,),
                Text(
                "Coocking",
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
               ),
               )
              ],
             ),
          ),
         ListTile(
          onTap: (){
            onSetect("meals");
          },
          leading: Icon(Icons.restaurant,color: Theme.of(context).colorScheme.onBackground,),
          title:  Text(
            "Meal",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary
          ),
          ),
         ),
         ListTile(
          onTap: (){
            onSetect("filters");
          },
          leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.onBackground,),
          title:  Text(
            "Filters",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
          ),
         ),
        ],
      ),
    );
  }
}