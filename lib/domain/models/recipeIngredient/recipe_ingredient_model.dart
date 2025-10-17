import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';

class RecipeIngredientModel {
  int? recipeIngredientId;
  IngredientData ingredient;
  UnitOfMeasureData unit;
  double quantity;

  RecipeIngredientModel({
    this.recipeIngredientId,
    required this.ingredient,
    required this.unit,
    required this.quantity,
  });
}
