import 'package:alchemist_arsenal/data/source/sqlite/tables/tables.dart';
import 'package:drift/drift.dart';

class RecipeIngredient extends Table {
  IntColumn get recipeIngredientId => integer().autoIncrement()();
  IntColumn get recipeId => integer().references(Recipe, #recipeId)();
  IntColumn get ingredientId =>
      integer().references(Ingredient, #ingredientId)();
  IntColumn get unitOfMeasureId =>
      integer().references(UnitOfMeasure, #unitOfMeasureId)();
  Column<double> get quantity => real()();
}
