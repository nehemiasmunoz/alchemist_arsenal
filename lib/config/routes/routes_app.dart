import 'package:alchemist_arsenal/presentation/screens.dart';
import 'package:flutter/material.dart';

class RoutesApp extends ChangeNotifier {
  bool _optionsVisibility = false;
  bool get optionsVisibility => _optionsVisibility;
  int _screenIndex = 0;
  int get screenIndex => _screenIndex;
  String get screenTitle => items[_screenIndex].label!;

  static List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Recipes"),
    BottomNavigationBarItem(icon: Icon(Icons.grain), label: "Ingredients"),
  ];

  static List<Widget> screens = [RecipesListScreen(), IngredientsListScreen()];

  void changeOptionsVisibility(bool? state) {
    _optionsVisibility = state ?? !_optionsVisibility;
    notifyListeners();
  }

  void setScreenIndex(int index) {
    _screenIndex = index;
    changeOptionsVisibility(false);
    notifyListeners();
  }
}
