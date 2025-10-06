import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/domain/repository/repositories.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class RecipeProvider extends ChangeNotifier {
  final RecipeRepository _recipeRepository;
  List<RecipeData> _recipes = [];
  bool _isLoading = false;

  RecipeProvider(RecipeRepository repo) : _recipeRepository = repo {
    getAllRecipes();
  }

  List<RecipeData> get recipes => _recipes;
  bool get isLoading => _isLoading;

  Future<void> getAllRecipes() async {
    _isLoading = true;
    _recipes = await _recipeRepository.getAllRecipes();
    _isLoading = false;
    notifyListeners();
  }

  Future<int> submitForm(
    int? id,
    String title,
    String description,
    String instructions,
  ) async {
    var recipe = RecipeCompanion(
      recipeId: Value.absentIfNull(id),
      title: Value(title),
      description: Value(description),
      instructions: Value(instructions),
    );
    if (id != null) {
      _updateRecipe(recipe);
    } else {
      id = await _createRecipe(recipe);
    }
    getAllRecipes();
    return id;
  }

  Future<int> _createRecipe(RecipeCompanion newRecipe) {
    return _recipeRepository.createRecipe(newRecipe);
  }

  Future<void> _updateRecipe(RecipeCompanion newRecipe) {
    return _recipeRepository.updateRecipe(newRecipe);
  }

  Future<void> deleteRecipe(int id) {
    final result = _recipeRepository.deleteRecipe(id);
    getAllRecipes();
    return result;
  }
}
