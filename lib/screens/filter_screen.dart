import 'package:flutter/material.dart';



enum Filter{
  gluten,
  lactose,
  vegan,
  vegeraian,
}
class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key,required this.currenFilters});
  
  final Map <Filter, bool> currenFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();

}

class _FilterScreenState extends State<FilterScreen> {


  bool glutenFreeFilter = false;
  bool lactoseFreeFilter = false;
  bool veganFreeFilter = false;
  bool vegeraianFreeFilter = false;


  @override
  void initState() {
    super.initState();
  glutenFreeFilter = widget.currenFilters[Filter.gluten]!;
  lactoseFreeFilter = widget.currenFilters[Filter.lactose]!;
  veganFreeFilter = widget.currenFilters[Filter.vegan]!;
  vegeraianFreeFilter = widget.currenFilters[Filter.vegeraian]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const  Text("Your Filters"),),


  //    drawer:  MainDrawer(onSetect: (identifer){
  //   Navigator.of(context).pop();
  //   if(identifer == "meals"){
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const TabScreen()));
  // }}),



      body: WillPopScope(
        onWillPop: ()async{
          Navigator.of(context).pop({
          Filter.gluten : glutenFreeFilter,
          Filter.lactose : lactoseFreeFilter,
          Filter.vegan : veganFreeFilter,
          Filter.vegeraian : vegeraianFreeFilter,
          });
          return false;
        },
        child: Column(
          children: [
           switchtilewidget(
            context,
            "Gluten-free",
            "Filters out gluten-containing meals.",
            glutenFreeFilter,
            (bool  value){
              setState(() {
                glutenFreeFilter = value;
              });
            },
            ),
              switchtilewidget(
            context,
            "Lactose-free",
            "Filters out Lactose-containing meals.",
            lactoseFreeFilter,
               (bool  value){
              setState(() {
                lactoseFreeFilter = value;
              });
            },
            ),
              switchtilewidget(
            context,
            "Vegan-free",
            "Filters out Vegan-containing meals.",
            veganFreeFilter,
               (bool  value){
              setState(() {
                veganFreeFilter = value;
              });
            },
            ),
              switchtilewidget(
            context,
            "vegetarian-free",
            "Filters out vegetaian-containing meals.",
            vegeraianFreeFilter,
               (bool  value){
              setState(() {
                vegeraianFreeFilter = value;
              });
            },
            ),
          ],
        ),
      ),
    );
  }

  SwitchListTile switchtilewidget(BuildContext context,String title ,String subtitle, bool filter,    Function(bool newValue) onChanged,
) {
    return SwitchListTile(
        onChanged:onChanged,
        value:filter,
        title:  Text(
          title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        ),
        subtitle:  Text(
          subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 34 , right: 22),
       );
  }
}