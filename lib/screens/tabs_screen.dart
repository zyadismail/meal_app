import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';



   const  kInitiakFilter = {
    Filter.gluten: false,
    Filter.lactose :false,
    Filter.vegan : false,
    Filter.vegeraian : false,
  };
class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Meal> favMeal = [];
 showInfoMessage(String message){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
  

   Map<Filter,bool> _selectedFilters = kInitiakFilter;

void _setScreen(String identifer){
    Navigator.of(context).pop();
  if(identifer == "filters"){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FilterScreen(
      currenFilters: _selectedFilters,
    ))
    ).then((value){
      setState(() {
        _selectedFilters = value??kInitiakFilter;
      });
    });
}   
}
  void togggleMealFvoute(Meal meal){
   final isExisting = favMeal.contains(meal);
   if(isExisting){
    setState(()=>favMeal.remove(meal));
    showInfoMessage("Meal is no longer a favorite");
   }else{
    setState(()=>favMeal.add(meal));
    showInfoMessage("Marked as a favorite");
   }
  }



  int pageIndex = 0;
  void selectPage(int index){
    setState(() {
    pageIndex  = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<Meal> availabeMeals = dummyMeals.where((element){
      if(_selectedFilters[Filter.gluten]! && !element.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filter.lactose]! && !element.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filter.vegan]! && !element.isVegan){
        return false;
      }
      if(_selectedFilters[Filter.vegeraian]! && !element.isVegetarian){
        return false;
      }
      return true;
    }).toList();
    Widget activePage =  CategoriesScreen(onToggleFav: togggleMealFvoute,availabeMeals: availabeMeals,);
    var activePageTitle = 'Categories';
    if(pageIndex == 1){
      activePage =  MealsScreen(
        meals:  favMeal, 
      onToggleFav:togggleMealFvoute,);
      activePageTitle = "Favorites";
    }
    return Scaffold(
      drawer:  MainDrawer(onSetect: _setScreen,),
      appBar: AppBar(title:Text (activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const  [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
            ),
        ],
        onTap: selectPage,
        currentIndex: pageIndex,
        ),
    );
  }
}