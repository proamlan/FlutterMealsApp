import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meal_screen.dart';

class TabScreen extends StatefulWidget {

  const TabScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {

  int _selectedIndex = 0;
  String _selectedTitle = "Categories";

  void _setSelectedIndex(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSelectedPage(){
    Widget selectedWidget = const CategoriesScreen();
    if(_selectedIndex == 1){
      selectedWidget = const MealsScreen(meals: []);
      _selectedTitle = "Favorites";
    }
    return selectedWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setSelectedIndex,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites")
        ],
      ),
      body: _getSelectedPage()
    );
  }

}
