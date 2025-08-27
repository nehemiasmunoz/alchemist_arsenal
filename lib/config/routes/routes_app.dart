import 'package:alchemist_arsenal/src/home/home_screen.dart';
import 'package:alchemist_arsenal/src/ingredient/screens/list/ingredients_list_screen.dart';
import 'package:alchemist_arsenal/src/recipe/screens/recipe_list_screen.dart';
import 'package:flutter/material.dart';

class RoutesApp extends ChangeNotifier {
  static String initialRoute = routes.keys.first;

  int _screenIndex = 0;
  int get screenIndex => _screenIndex;
  static List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Recipes"),
    BottomNavigationBarItem(icon: Icon(Icons.grain), label: "Ingredients"),
  ];

  static List<Widget> screens = [RecipesListScreen(), IngredientsListScreen()];

  static final Map<String, Widget Function(BuildContext)> routes = {
    "home": (ctx) => HomeScreen(),
  };

  void setScreenIndex(int index) {
    _screenIndex = index;
    notifyListeners();
  }
}
