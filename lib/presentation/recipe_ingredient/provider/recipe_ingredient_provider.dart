import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/domain/models/recipeIngredient/recipe_ingredient_model.dart';
import 'package:alchemist_arsenal/domain/repository/repositories.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

class RecipeIngredientProvider extends ChangeNotifier {
  late RecipeIngredientRepository recipeIngredientRepository;
  List<RecipeIngredientModel> _ingredients = [];
  List<RecipeIngredientModel> get ingredients => _ingredients;
  final List<int> _ingredientsToDelete = [];

  RecipeIngredientProvider(RecipeIngredientRepository recipeIngredientRepo) {
    recipeIngredientRepository = recipeIngredientRepo;
  }

  void saveData(int recipeId) {
    if (_ingredients.isEmpty) return;
    if (_ingredientsToDelete.isNotEmpty) {
      recipeIngredientRepository.deleteAllIngredientsWhere(
        _ingredientsToDelete,
      );
    }

    var ingredientsWithRecipeId = _ingredients.map((e) {
      return RecipeIngredientCompanion.insert(
        recipeIngredientId: Value.absentIfNull(e.recipeIngredientId),
        recipeId: recipeId,
        ingredientId: e.ingredient.ingredientId,
        unitOfMeasureId: e.unit.unitOfMeasureId,
        quantity: e.quantity,
      );
    }).toList();

    recipeIngredientRepository.saveAllRecipeIngredients(
      ingredientsWithRecipeId,
    );

    _ingredients.clear();
    _ingredientsToDelete.clear();
    notifyListeners();
  }

  void addIngredientToList({
    required UnitOfMeasureData unit,
    required IngredientData ingredient,
    required double quantity,
  }) {
    _ingredients.add(
      RecipeIngredientModel(
        ingredient: ingredient,
        unit: unit,
        quantity: quantity,
      ),
    );
    notifyListeners();
  }

  void removeIngredientFromList(RecipeIngredientModel recipeIngredient) {
    if (recipeIngredient.recipeIngredientId != null) {
      _ingredientsToDelete.add(recipeIngredient.recipeIngredientId!);
    }
    _ingredients.remove(recipeIngredient);
    notifyListeners();
  }

  void getAllIngredientsFromRecipe(int recipeId) async {
    _ingredients = await recipeIngredientRepository
        .getAllIngredientsWhereRecipe(recipeId);
    notifyListeners();
  }

  void clearIngredients() {
    _ingredients.clear();
    _ingredientsToDelete.clear();
  }
}
